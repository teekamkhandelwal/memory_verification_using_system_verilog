`define MON_IF vif.MONITOR.monitor_cb
class monitor;
  virtual simple vif;
  mailbox m2s;
 
   
  function new(virtual simple vif, mailbox m2s);
  this.vif=vif;
  this.m2s=m2s;
  endfunction
  
  task main;
    forever begin
    transaction trans;
    trans=new();
    @(posedge vif.MONITOR.clk);
      wait(`MON_IF.rd_en || `MON_IF.wr_en);
        trans.addr  = `MON_IF.addr;
        trans.wr_en = `MON_IF.wr_en;
        trans.wdata = `MON_IF.wdata;
        if(`MON_IF.rd_en) begin
          trans.rd_en = `MON_IF.rd_en;
         @(posedge vif.MONITOR.clk);
          @(posedge vif.MONITOR.clk);
          trans.rdata = `MON_IF.rdata;
       
        end     
        m2s.put(trans);
    end
  endtask

endclass
