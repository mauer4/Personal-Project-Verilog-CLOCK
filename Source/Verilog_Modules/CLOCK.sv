`timescale 1 ps / 1 ps
`define Fifty_M 26'b10111110101111000010000000


module CLOCK(input logic clk, input logic rst, input logic set_TMOD,
             input logic set_min, input logic set_hr,
             output logic [5:0] sec, output logic [5:0] min, output logic [4:0] hr);

    enum bit {CLK_RUN, CLK_SET} TMOD;

    logic [25:0] counter;
    logic rst_counter;

    // register for the time
    logic [5:0] next_sec, next_min;
    logic [4:0] next_hr;
    logic rst_sec, rst_min, rst_hr;
    logic inc_sec, inc_min, inc_hr;

    //state transition logic
    always_ff @(posedge set_TMOD) begin
      if(~rst) TMOD <= CLK_SET;
      else begin
        if(TMOD == CLK_SET) TMOD <= CLK_RUN;
        else TMOD <= CLK_SET;
      end
    end

    //clk time registers
    always_ff @(posedge clk) begin
        if(~rst) counter = 0;
        else begin
          if(~rst_counter)
            counter <= counter + 1'b1;
          else counter <= 0;
        end
    end

    assign rst_counter = (counter == `Fifty_M) ? 1'b1 : 1'b0;

    assign inc_sec = (TMOD == CLK_SET)  ? ~rst : rst_counter;

    always_ff @(posedge inc_sec) begin
      if(~rst) sec <= 0;
      else if(rst_sec) sec <= 0;
      else sec <= sec + 1'b1;
    end

    assign rst_sec = (sec == 6'd59) ? 1'b1 : 1'b0;

    assign inc_min = (TMOD == CLK_SET) ? set_min : (sec == 6'b0);

    always_ff @(posedge inc_min) begin
      if(~rst) min <= 0;
      else if(rst_min) min <= 0;
      else min <= min + 1'b1;
    end

    assign rst_min = (min == 6'd59) ? 1'b1 : 1'b0;

    assign next_min = rst_min ? 6'b0 : min + 1'b1;

    assign inc_hr = (TMOD == CLK_SET) ? set_hr : (min == 6'b0);

    always_ff @(posedge inc_hr) begin
      if(~rst) hr <= 0;
      else if(rst_hr) hr <= 0;
      else hr <= hr + 1'b1;
    end

    assign rst_hr = (hr == 5'd23) ? 1'b1 : 1'b0;

    assign next_hr = rst_hr ? 5'b0 : hr + 1'b1;

endmodule: CLOCK
