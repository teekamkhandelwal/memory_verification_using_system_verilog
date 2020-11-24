// Code your testbench here
// or browse Examples
`include "interface.sv"
`include "test.sv"
module test1;
  bit clk;
  bit rst;
  
  always #5 clk = ~clk;
  
  initial begin
  rst = 1;
  #5 rst =0;
end
  simple intf(clk,rst);
  
  memory DUT (
  .clk(intf.clk),
    .reset(intf.rst),
  .addr(intf.addr),
  .wr_en(intf.wr_en),
  .rd_en(intf.rd_en),
  .wdata(intf.wdata),
  .rdata(intf.rdata)
 );
  test t1(intf);
  initial begin
  $dumpfile("dump.vcd"); $dumpvars;
end
  
endmodule
