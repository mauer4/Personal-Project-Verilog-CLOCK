`timescale 1 ps / 1 ps

module tb_clock_top_rtl();

  logic err;

  logic tb_clk;
  logic [3:0] tb_KEY;
  logic [9:0] tb_SW, tb_LEDR;
  logic [6:0] tb_HEX0, tb_HEX1, tb_HEX2, tb_HEX3, tb_HEX4, tb_HEX5;

  clock_top DUT(tb_clk, tb_KEY, tb_SW, tb_LEDR,
    tb_HEX0, tb_HEX1, tb_HEX2, tb_HEX3, tb_HEX4, tb_HEX5);

  initial begin
    tb_clk = 0;
    forever #5 tb_clk = ~tb_clk;
  end

  initial begin
    err = 0;
    tb_KEY = 4'b1111;
    #20;

    // click rst once
    tb_KEY[3] = 0;
    #15;

    tb_KEY[2] = 0;
    #10;
    tb_KEY[2] = 1;

    tb_KEY[1] = 0;
    #10;
    tb_KEY[1] = 1;

    tb_KEY[0] = 0;
    #10;
    tb_KEY[0] = 1;

    tb_KEY[3] = 1;


    assert(DUT.sec == 0) else begin err = 1; $error("sec is not reset"); end
    assert(DUT.min == 0) else begin err = 1; $error("min is not reset"); end
    assert(DUT.hr == 0) else begin err = 1; $error("hr is not reset"); end

    //wait 5 cycles
    repeat (5) begin
      @(posedge tb_clk) ;
    end

    tb_KEY[1] = 0;
    #15;
    tb_KEY[1] = 1;

    assert(DUT.hr == 1) else begin err = 1; $error("hr is not incremented"); end
    #10;

    tb_KEY[1] = 0;
    #15;
    tb_KEY[1] = 1;

    assert(DUT.hr == 2) else begin err = 1; $error("hr is not incremented"); end

    repeat (15) begin
      tb_KEY[0] = 0;
      #5;
      tb_KEY[0] = 1;
      #5;
    end

    assert(DUT.min == 15) else begin err = 1; $error("min is not incremented 15 times"); end

    // click rst once
    tb_KEY[2] = 0;
    #15;
    tb_KEY[2] = 1;

    if(err) $display("FAILED SIMULATION");
    else $display("SUCCESSFUL SIMULATION");

  end

endmodule: tb_clock_top_rtl
