class generator;
  
  transaction trans;
  mailbox mbx;
  event endded;
  int rpt_count;
  
  function new(mailbox mbx, event endded);
    this.mbx=mbx;
    this.endded=endded;
  endfunction
  
  task main;
    repeat(rpt_count) begin
    trans=new();
      if(! trans.randomize()) $fatal("Gen:: trans randomization failed");
      mbx.put(trans);
    end
    ->endded;
  endtask
endclass
