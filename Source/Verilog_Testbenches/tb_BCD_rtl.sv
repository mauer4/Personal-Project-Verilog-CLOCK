`timescale 1 ps / 1 ps

module tb_BCD_rtl();

  logic [7:0] tb_in;
  logic [3:0] tb_out1, tb_out2;

  BCD DUT(tb_in, tb_out1, tb_out2);

  initial begin
    tb_in = 8'd15; #5;
    assert({tb_out2, tb_out1} == 8'b00010101) else $error("Wrong output for test 1 => 15");

    tb_in = 8'd4; #5;
    assert({tb_out2, tb_out1} == 8'b00000100) else $error("Wrong output for test 2 => 4");

    tb_in = 8'd12; #5;
    assert({tb_out2, tb_out1} == 8'b00010010) else $error("Wrong output for test 3 => 12");

  end

endmodule: tb_BCD_rtl
