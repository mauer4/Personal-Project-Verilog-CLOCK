`timescale 1 ps / 1 ps
`define Fifty_M 26'b10111110101111000010000000


module CLOCK(input logic clk, input logic rst,
             input logic set_min, input logic set_hr, input logic AM2PM,
             output logic [5:0] sec, output logic [5:0] min, output logic [4:0] hr);

    enum bit {CLK_RUN, CLK_SET} TMOD;

    logic [25:0] counter, next_counter;
    logic rst_counter;

    // register for the time
    logic [5:0] next_sec, next_min;
    logic [4:0] next_hr;
    logic rst_sec, rst_min, rst_hr;
    logic inc_sec, inc_min, inc_hr;

    //state transition logic
    always_ff @(negedge rst)
      TMOD <= (TMOD == CLK_RUN) ? CLK_SET : CLK_RUN ;

    //clk time registers
    always_ff @(posedge clk) begin
      counter <= counter + 1'b1;
      if(counter == `Fifty_M)
        counter <= 0;
    end

    assign rst_counter = (counter == `Fifty_M) ? 1'b1 : 1'b0;
    assign inc_sec = TMOD ? 1'b0 : rst_counter;

    always_ff @(posedge inc_sec)
      sec <= next_sec;

    assign rst_sec = (sec == 6'd59) ? 1'b1 : 1'b0;

    assign next_sec = rst_sec ? 6'b0 : sec + 1'b1;

    assign inc_min = TMOD ? set_min : rst_sec;

    always_ff @(posedge inc_min)
      min <= next_min;

    assign rst_min = (min == 6'd59) ? 1'b1 : 1'b0;

    assign next_min = rst_min ? 6'b0 : min + 1'b1;

    assign inc_hr = TMOD ? set_hr : rst_min;

    always_ff @(posedge inc_hr)
      hr <= next_hr;

    assign rst_hr = (hr == 5'd23) ? 1'b1 : 1'b0;

    assign next_hr = rst_hr ? 5'b0 : hr + 1'b1;

endmodule: CLOCK
