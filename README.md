# memory_verification_using_system_verilog
In this respiratory having two verification methods first have without scoreboard and monitor and second with includes all component
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
RTL DESIGN
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
memory design specification
in memory design write and read signal is control by the two seperate signal wr_en and rd_en and have two bit address signal which create only  4 unique addresss for read write operation and data input for write operation is doing by wdata signal and data out  for read is rdata signal the memory block diagram is following

![image](https://user-images.githubusercontent.com/72481400/100048173-3eb59300-2e3a-11eb-9aaa-4843f6a6d437.png)

1)write operation
wr_en and wdata and addr  is done in one positive cycle
2)read operation
rd_en and addr its done in one cyclle and rdata is done in next cycle

in rtl design hving following signals 

![image](https://user-images.githubusercontent.com/72481400/100047895-90a9e900-2e39-11eb-94b2-f571c0ebd4e8.png)

---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
DESIGN VERIFICATION
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
in first testbench contaning filloeing component
1) transaction
2) interface
3) driver
4) genertor
5) environment
6) testbanch
7) test

testbench1 archtecture

![image](https://user-images.githubusercontent.com/72481400/100047204-e382a100-2e37-11eb-945c-e6aca0c99e60.png)

---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
OUTPUT
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
 
 the output of the verification plan1 without monitor and scoreboard 
 
 Contains Synopsys proprietary information.
Compiler version Q-2020.03-SP1-1; Runtime version Q-2020.03-SP1-1;  Nov 23 22:52 2020
--------- [DRIVER] Reset Started ---------
--------- [DRIVER] Reset Ended ---------
--------- [DRIVER-TRANSFER: 0] ---------
	ADDR = 3 	WDATA = a9
-----------------------------------------
--------- [DRIVER-TRANSFER: 1] ---------
	ADDR = 3 	RDATA = a9
-----------------------------------------
--------- [DRIVER-TRANSFER: 2] ---------
	ADDR = 2 	RDATA = ff
-----------------------------------------
--------- [DRIVER-TRANSFER: 3] ---------
	ADDR = 1 	WDATA = aa
-----------------------------------------
--------- [DRIVER-TRANSFER: 4] ---------
	ADDR = 1 	RDATA = aa
-----------------------------------------
--------- [DRIVER-TRANSFER: 5] ---------
	ADDR = 3 	RDATA = a9
-----------------------------------------
--------- [DRIVER-TRANSFER: 6] ---------
	ADDR = 0 	WDATA = f9
-----------------------------------------
--------- [DRIVER-TRANSFER: 7] ---------
	ADDR = 0 	WDATA = 1f
-----------------------------------------
--------- [DRIVER-TRANSFER: 8] ---------
	ADDR = 3 	RDATA = a9
-----------------------------------------
--------- [DRIVER-TRANSFER: 9] ---------
	ADDR = 3 	RDATA = a9
-----------------------------------------
--------- [DRIVER-TRANSFER: 10] ---------
	ADDR = 0 	RDATA = 1f
-----------------------------------------
--------- [DRIVER-TRANSFER: 11] ---------
	ADDR = 1 	RDATA = aa
-----------------------------------------
--------- [DRIVER-TRANSFER: 12] ---------
	ADDR = 2 	RDATA = ff
-----------------------------------------
--------- [DRIVER-TRANSFER: 13] ---------
	ADDR = 2 	WDATA = 13
-----------------------------------------
--------- [DRIVER-TRANSFER: 14] ---------
	ADDR = 1 	RDATA = aa
-----------------------------------------
--------- [DRIVER-TRANSFER: 15] ---------
	ADDR = 3 	RDATA = a9
-----------------------------------------
--------- [DRIVER-TRANSFER: 16] ---------
	ADDR = 0 	RDATA = 1f
-----------------------------------------
--------- [DRIVER-TRANSFER: 17] ---------
	ADDR = 2 	WDATA = 99
-----------------------------------------
--------- [DRIVER-TRANSFER: 18] ---------
	ADDR = 1 	RDATA = aa
-----------------------------------------
--------- [DRIVER-TRANSFER: 19] ---------
	ADDR = 2 	WDATA = cb
-----------------------------------------
$finish called from file "environment.sv", line 55.
$finish at simulation time                  535

---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
SIMULATION WAVEFORM
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

![image](https://user-images.githubusercontent.com/72481400/100048760-999bba00-2e3b-11eb-813e-c1ccc017b03c.png)


