`include "transaction.sv"
`include "generator.sv"
`include "driver.sv"
`include "monitor.sv"
`include "scoreboard.sv"


class environment;
   
  //generator and driver instance
  generator gen;
  driver    driv;
  monitor mon;
  scoreboard sco;
  mailbox m2s;
   
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
    m2s=new();
     
    //creating generator and driver
    gen = new(mbx,g_ended);
    driv = new(mbx,vif);
    mon=new(vif,m2s);
    sco=new(m2s);
  endfunction
 
  task pre_test();
    driv.reset();
  endtask
   
  task test();
    fork
    gen.main();
    driv.main();
    mon.main();
    sco.main();
    join_any
  endtask
   
  task post_test();
    wait(g_ended.triggered);
    wait(gen.rpt_count == driv.no_trans);
    wait(gen.rpt_count==sco.no_trans);
  endtask 
   
  //run task
  task run;
    pre_test();
    test();
    post_test();
    $finish;
  endtask
   
endclass
