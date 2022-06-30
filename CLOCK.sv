`timescale 1 ps / 1 ps

// add counter logic_range
// check why time resets when going from SET to CLK

module sec_inc_clk(input logic [5:0] sec_in, input logic [5:0] min_in, logic [4:0] hr_in,
               input logic set_AMPM,
               output logic [5:0] sec_out, output logic [5:0] min_out, output logic [4:0] hr_out);
   always_comb begin
       if(sec_in < 59)
         sec_out = sec_in + 1'b1;
       else begin
         sec_out = 0;
         if(min_in < 59)
           min_out = min_in + 1'b1;
         else begin
           min_out = 0;
           if(hr_in < 23)
             hr_out = hr_in + 1'b1;
           else
             hr_out = 0;
         end
       end
   end

endmodule: sec_inc_clk


module CLOCK(input logic clk, input logic rst,
             input logic set_min, input logic set_hr, input logic set_AMPM,
             output logic [5:0] sec, output logic [5:0] min, output logic [4:0] hr, output logic AMPM);

    enum {WAIT, SET, CLK} state, next_state;

    logic [15:0] counter;

    // register for the time
    logic [5:0] next_sec, next_min;
    logic [4:0] next_hr;
    logic [16:0] clk_time, next_clk_time;
    assign {next_sec, next_min, next_hr} = next_clk_time;
    assign {sec,min,hr} = clk_time;

    // registers for the set mechanism
    logic inc_min, inc_hr;
    logic [5:0] add_sec, add_min, next_add_sec, next_add_min;
    logic [4:0] add_hr, next_add_hr;
    logic [16:0] add_time, next_add_time;
    assign {next_add_sec, next_add_min, next_add_hr} = next_add_time;
    assign {add_sec,add_min,add_hr} = add_time;

    //wires output of the increase time module
    logic [5:0] sec_increased, min_increased;
    logic [4:0] hr_increased;
    logic [16:0] increased_time;
    assign {sec_increased, min_increased, hr_increased} = increased_time;

    sec_inc_clk increase_second(sec, min, hr, set_AMPM, increased_time[16:11], increased_time[10:5], increased_time[4:0]);

    assign AMPM = (hr < 12) ? 1'b1 : 0;

    always_ff @(posedge inc_min) add_time[10:5] <= next_add_min;
    always_ff @(posedge inc_hr)  add_time[4:0] <= next_add_hr;
    always_ff @(negedge rst)     state <= next_state;

    always_ff @(posedge clk) begin
      clk_time <= next_clk_time;
      add_time[16:11] <= next_clk_time[16:11];
    end

    always_comb begin
      next_state = state;
      case(state)
        WAIT: next_state = SET;
        SET: next_state = CLK;
        CLK: next_state = SET;
      endcase
    end

    always_comb begin
      next_add_time = clk_time;
      next_clk_time = clk_time;
      inc_min = 0; inc_hr = 0;
      case(state)
        WAIT: {next_clk_time, next_add_time, inc_min, inc_hr} = {{2{18'b0}}, clk, clk};
        SET:  begin
                next_clk_time = add_time;
                next_add_time = {6'b0, add_time[10:5] + 1'b1, add_time[4:0] + 1'b1};
                inc_min = set_min;
                inc_hr = set_hr;
              end
        CLK:  {next_clk_time, next_add_time, inc_min, inc_hr} = {increased_time, clk_time, clk, clk};
      endcase
    end

endmodule: CLOCK
