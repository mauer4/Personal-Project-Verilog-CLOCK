`timescale 1 ps / 1 ps

module tb_CLOCK_rtl();

  logic tb_clk, tb_rst, tb_set_min, tb_set_hr, tb_set_AMPM;
  logic [5:0] tb_sec, tb_min;
  logic [4:0] tb_hr;
  logic tb_AMPM;

  logic err;

  CLOCK DUT(tb_clk, tb_rst,
               tb_set_min, tb_set_hr, tb_set_AMPM,
               tb_sec, tb_min, tb_hr);

  initial begin
    tb_clk = 0;
    forever #5 tb_clk = ~tb_clk;
  end

  initial begin
    err = 0;
    tb_set_min = 0;
    tb_set_hr = 0;
    tb_set_AMPM = 0;
    tb_rst = 1;
    #5;
    #10;

    {tb_set_hr, tb_set_min} = 2'b11;
    #5;
    {tb_set_hr, tb_set_min} = 2'b0;

    tb_rst = 1;
    #5;
    #10;
    //click set_min once
    tb_set_min = 1;
    #5;
    tb_set_min = 0;
    #5;

    //click set_min once
    tb_set_min = 1;
    #5;
    tb_set_min = 0;
    #5;

    //click set_min once
    tb_set_hr = 1;
    #5;
    tb_set_hr = 0;
    #5;

    #5;
    tb_rst = 0;
    #5;
    tb_rst = 1;

  end

/*
  //click set_min once
  tb_set_min = 1;
  #2;
  tb_set_min = 0;
  #2;

  //click set_min once
  tb_set_hr = 1;
  #2;
  tb_set_hr = 0;
  #2;

  //click set_min once
  tb_set_AMPM = 1;
  #2;
  tb_set_AMPM = 0;
  #2;
*/
endmodule: tb_CLOCK_rtl
