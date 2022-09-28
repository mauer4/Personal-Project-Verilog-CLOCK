`timescale 1 ps / 1 ps

module tb_CLOCK_rtl();

  logic tb_clk, tb_rst, tb_set_min, tb_set_hr, tb_set_TMOD;
  logic [5:0] tb_sec, tb_min;
  logic [4:0] tb_hr;
  logic tb_AMPM;

  logic err;

  CLOCK DUT(tb_clk, tb_rst, tb_set_TMOD,
               tb_set_min, tb_set_hr,
               tb_sec, tb_min, tb_hr);

  initial begin
    tb_clk = 0;
    forever #5 tb_clk = ~tb_clk;
  end

  initial begin
    err = 0;
    tb_set_min = 0;
    tb_set_hr = 0;
    tb_rst = 1;
    tb_set_TMOD = 0;

    #5;
    #10;

    #5;
    tb_rst = 0;

    tb_set_TMOD = 1;
    #5;
    tb_set_TMOD = 0;
    {tb_set_hr, tb_set_min} = 2'b11;
    #5;
    {tb_set_hr, tb_set_min} = 2'b0;

    assert(DUT.counter == 0) else begin err = 1; $error("counter is not reset"); end
    assert(DUT.sec == 0) else begin err = 1; $error("sec is not reset"); end
    assert(DUT.min == 0) else begin err = 1; $error("min is not reset"); end
    assert(DUT.hr == 0) else begin err = 1; $error("hr is not reset"); end

    tb_rst = 1;
    #5;
    #10;
    //click set_min once
    tb_set_min = 1;
    #5;
    tb_set_min = 0;
    #5;

    assert(DUT.min == 1) else begin err = 1; $error("min is not incremented"); end

    //click set_min once
    tb_set_min = 1;
    #5;
    tb_set_min = 0;
    #5;
    assert(DUT.min == 2) else begin err = 1; $error("min is not incremented"); end
    //click set_min once
    tb_set_hr = 1;
    #5;
    tb_set_hr = 0;
    #5;

    assert(DUT.hr == 1) else begin err = 1; $error("hr is not incremented"); end

    tb_set_TMOD = 1;
    #5;
    tb_set_TMOD = 0;

    if(err) $display("FAILED SIMULATION");
    else $display("SUCCESSFUL SIMULATION");

  end

endmodule: tb_CLOCK_rtl
