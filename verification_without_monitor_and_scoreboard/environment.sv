`include "transaction.sv"
`include "generator.sv"
`include "driver.sv"


class environment;
   
  //generator and driver instance
  generator gen;
  driver    driv;
   
  //mailbox handle's
  mailbox mbx;
   
  //event for synchronization between generator and test
  event g_ended;
   
  //virtual interface
  virtual simple vif;
   
  //constructor
  function new(virtual simple vif);
    //get the interface from test
    this.vif = vif;
     
    //creating the mailbox (Same handle will be shared across generator and driver)
    mbx = new();
     
    //creating generator and driver
    gen = new(mbx,g_ended);
    driv = new(mbx,vif);
  endfunction
 
  task pre_test();
    driv.reset();
  endtask
   
  task test();
    fork
    gen.main();
    driv.main();
    join_any
  endtask
   
  task post_test();
    wait(g_ended.triggered);
    wait(gen.rpt_count == driv.no_trans);
  endtask 
   
  //run task
  task run;
    pre_test();
    test();
    post_test();
    $finish;
  endtask
   
endclass
