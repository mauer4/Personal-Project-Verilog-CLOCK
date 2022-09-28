`timescale 1 ps / 1 ps

module BCD(input logic [5:0] in, output logic [3:0] out1, output logic [3:0] out2);

  integer i;

  logic [7:0] bcd;

  assign {out2, out1} = bcd;

  always_comb begin
      bcd=0;
      for (i=0;i<6;i=i+1) begin					//Iterate once for each bit in input number
        if (bcd[3:0] >= 5) bcd[3:0] = bcd[3:0] + 3;		//If any BCD digit is >= 5, add three
      	if (bcd[7:4] >= 5) bcd[7:4] = bcd[7:4] + 3;
      	bcd = {bcd[6:0],in[5-i]};				//Shift one bit, and shift in proper bit from input
      end
  end

endmodule: BCD
