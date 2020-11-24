`define DRIV_IF vif.DRIVER.driver_cb

class driver;
  transaction trans;
  mailbox mbx;
  virtual simple vif;
  int no_trans;
  
  function new(mailbox mbx, virtual simple vif);
  this.mbx=mbx;
    this.vif=vif;
  endfunction
  
  task reset;
    wait(vif.rst);
    $display("--------- [DRIVER] Reset Started ---------");
  `DRIV_IF.wr_en <= 0;
  `DRIV_IF.rd_en <= 0;
  `DRIV_IF.addr  <= 0;
  `DRIV_IF.wdata <= 0;       
    wait(!vif.rst);
  $display("--------- [DRIVER] Reset Ended ---------");
  endtask
  
  task main;
    forever begin
      transaction trans;
      `DRIV_IF.wr_en <= 0;
      `DRIV_IF.rd_en <= 0;
      mbx.get(trans);
      $display("--------- [DRIVER-TRANSFER: %0d] ---------",no_trans);
      @(posedge vif.DRIVER.clk);
        `DRIV_IF.addr <= trans.addr;
      if(trans.wr_en) begin
        `DRIV_IF.wr_en <= trans.wr_en;
        `DRIV_IF.wdata <= trans.wdata;
        $display("\tADDR = %0h \tWDATA = %0h",trans.addr,trans.wdata);
        @(posedge vif.DRIVER.clk);
      end
      if(trans.rd_en) begin
        `DRIV_IF.rd_en <= trans.rd_en;
        @(posedge vif.DRIVER.clk);
        `DRIV_IF.rd_en <= 0;
        @(posedge vif.DRIVER.clk);
        trans.rdata = `DRIV_IF.rdata;
        $display("\tADDR = %0h \tRDATA = %0h",trans.addr,`DRIV_IF.rdata);
      end
      $display("-----------------------------------------");
      no_trans++;
    end
  endtask
  endclass
