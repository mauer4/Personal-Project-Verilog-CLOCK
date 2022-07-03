`timescale 1 ps / 1 ps

module clock_top(input logic CLOCK_50, input logic [3:0] KEY,
             input logic [9:0] SW, output logic [9:0] LEDR,
             output logic [6:0] HEX0, output logic [6:0] HEX1, output logic [6:0] HEX2,
             output logic [6:0] HEX3, output logic [6:0] HEX4, output logic [6:0] HEX5);

    logic AMPM;
    logic [4:0] hr;
    logic [5:0] min ,sec;

    CLOCK clk(.clk(CLOCK_50), .rst(KEY[3]), .set_min(~KEY[0]), .set_hr(~KEY[1]),
              .AM2PM(~KEY[2]), .sec, .min, .hr);

    BCD clk_bcd_conversion(.sec, .min, .hr, .AMPM, .HEX0, .HEX1, .HEX2,
                       .HEX3, .HEX4, .HEX5);

endmodule: clock_top
