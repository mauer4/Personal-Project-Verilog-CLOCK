`timescale 1 ps / 1 ps
`include "CLOCK.sv"
`include "card7seg.sv"
`include "BCD.sv"


module clock_top(input logic CLOCK_50, input logic [3:0] KEY,
             input logic [9:0] SW, output logic [9:0] LEDR,
             output logic [6:0] HEX0, output logic [6:0] HEX1, output logic [6:0] HEX2,
             output logic [6:0] HEX3, output logic [6:0] HEX4, output logic [6:0] HEX5);

    logic AMPM;
    logic [4:0] hr;
    logic [5:0] min ,sec;

    CLOCK clk_module(.clk(CLOCK_50), .rst(KEY[3]), .set_TMOD(~KEY[2]), .set_min(~KEY[0]), .set_hr(~KEY[1]),
              .sec(sec), .min(min), .hr(hr));

    logic [3:0] sec_dig1, sec_dig2, min_dig1, min_dig2, hr_dig1, hr_dig2;

    BCD sec_bcd_conversion(.in(sec), .out1(sec_dig1), .out2(sec_dig2));
    BCD min_bcd_conversion(.in(min), .out1(min_dig1), .out2(min_dig2));
    BCD hr_bcd_conversion(.in({1'b0,hr}), .out1(hr_dig1), .out2(hr_dig2));

    card7seg sec_1(sec_dig1, HEX0);
    card7seg sec_2(sec_dig2, HEX1);
    card7seg min_1(min_dig1, HEX2);
    card7seg min_2(min_dig2, HEX3);
    card7seg hr_1(hr_dig1, HEX4);
    card7seg hr_2(hr_dig2, HEX5);

endmodule: clock_top
