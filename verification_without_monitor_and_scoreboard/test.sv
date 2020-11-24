`include "environment.sv"

program test(simple vif);
  environment env;
  
  initial begin
    env=new(vif);
    env.gen.rpt_count=20;
    env.run();
    end
endprogram
