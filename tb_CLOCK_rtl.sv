`timescale 1 ps / 1 ps

module tb_CLOCK_rtl();

  logic tb_clk, tb_rst, tb_set_min, tb_set_hr, tb_set_AMPM;
  logic [5:0] tb_sec, tb_min;
  logic [4:0] tb_hr;
  logic tb_AMPM;

  CLOCK DUT(tb_clk, tb_rst,
               tb_set_min, tb_set_hr, tb_set_AMPM,
               tb_sec, tb_min, tb_hr, tb_AMPM);

  initial begin
    tb_clk = 0;
    forever #1 tb_clk = ~tb_clk;
  end

  initial begin
    tb_set_min = 0;
    tb_set_hr = 0;
    tb_set_AMPM = 0;
    tb_rst = 1;
    #2;
    #4;
    
    //click set_min once
    tb_set_min = 1;
    #2;
    tb_set_min = 0;
    #2;

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

    #2;
    tb_rst = 0;
    #2;
    tb_rst = 1;

    #100000;
    tb_rst = 0;
    #2;
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
