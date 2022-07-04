`timescale 1 ps / 1 ps

`define SW_0    4'b0000
`define SW_1    4'b0001
`define SW_2    4'b0010
`define SW_3    4'b0011
`define SW_4    4'b0100
`define SW_5    4'b0101
`define SW_6    4'b0110
`define SW_7    4'b0111
`define SW_8    4'b1000
`define SW_9    4'b1001
`define SW_a    4'b1010
`define SW_b    4'b1011
`define SW_c    4'b1100
`define SW_d    4'b1101
`define SW_e    4'b1110
`define SW_f    4'b1111

`define HEX_Blank 7'b0000000   
`define HEX_0     7'b1111110
`define HEX_1     7'b1110111
`define HEX_2     7'b1011011
`define HEX_3     7'b1001111
`define HEX_4     7'b1100110
`define HEX_5     7'b1101101
`define HEX_6     7'b1111101
`define HEX_7     7'b0000111
`define HEX_8     7'b1111111
`define HEX_9     7'b1101111
`define HEX_a     7'b0111111
`define HEX_b     7'b0011110
`define HEX_c     7'b1100111
`define HEX_d     7'b1110110
`define HEX_e

module card7seg(input logic [3:0] digit_in, output logic [6:0] HEX);

   always_comb begin
      case(digit_in)
         `SW_0: HEX = ~`HEX_0;
         `SW_1: HEX = ~`HEX_1;
         `SW_2: HEX = ~`HEX_2;
         `SW_3: HEX = ~`HEX_3;
         `SW_4: HEX = ~`HEX_4;
         `SW_5: HEX = ~`HEX_5;
         `SW_6: HEX = ~`HEX_6;
         `SW_7: HEX = ~`HEX_7;
         `SW_8: HEX = ~`HEX_8;
         `SW_9: HEX = ~`HEX_9;
         `SW_a: HEX = ~`HEX_a;
         `SW_b: HEX = ~`HEX_b;
         `SW_c: HEX = ~`HEX_c;
         `SW_d: HEX = ~`HEX_d;      
         default: begin
            HEX = ~`HEX_Blank;
         end
      endcase
   end
   
endmodule: card7seg

