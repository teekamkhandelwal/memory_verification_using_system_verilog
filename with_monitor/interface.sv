interface simple(input logic clk,rst);
  logic [1:0] addr;
  logic wr_en;
  logic rd_en;
  logic [7:0] wdata;
  logic [7:0] rdata;
  clocking driver_cb @(posedge clk);
  default input #1 output #1;
    output addr;
    output wr_en;
    output rd_en;
    output wdata;
    input rdata;
  endclocking
  
  clocking monitor_cb @(posedge clk);
    default input #1 output #1;
    input addr;
    input wr_en;
    input rd_en;
    input wdata;
    input rdata;
  endclocking
  
  modport DRIVER  (clocking driver_cb,input clk,rst);
  
  //monitor modport  
    modport MONITOR (clocking monitor_cb,input clk,rst);
  
    
endinterface
