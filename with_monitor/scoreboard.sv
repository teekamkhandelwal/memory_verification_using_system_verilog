
class scoreboard;
  mailbox m2s;
  int no_trans;
  bit [7:0] mem[4];
   
  function new(mailbox m2s);
  this.m2s=m2s;
  foreach(mem[i]) mem[i] = 8'hFF;
  endfunction
  
  task main;
    transaction trans;
    forever begin
    // #5;
      m2s.get(trans);
      if(trans.rd_en) begin
      if(mem[trans.addr] != trans.rdata)
        $error("[SCB-FAIL] Addr = %0h,\n \t   Data :: Expected = %0h Actual = %0h",trans.addr,mem[trans.addr],trans.rdata);
      else
        $display("[SCB-PASS] Addr = %0h,\n \t   Data :: Expected = %0h Actual = %0h",trans.addr,mem[trans.addr],trans.rdata);
    end
    else if(trans.wr_en)
      mem[trans.addr] = trans.wdata;
 
    no_trans++;
    end
    
  endtask
endclass
