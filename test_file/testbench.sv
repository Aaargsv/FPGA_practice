`timescale 1ns / 1ps
module testbench;
	
	    logic				clk_50mhz;
		logic				reset;
		
		logic				incrm_cntl;
		logic				decrm_cntl;
		logic				shift_cntl;
	
		logic				set;
		logic				i_work_enable;
		logic				nsyst;
		
	 	logic  [5:0]		data;
	  	logic  [6:0] 		seven_Display [5:0];
		logic				clk_1hz;

		DUT mydevice(.*);
		
		initial 
			begin
				
				clk_50mhz = 0;
				reset = 1;
				
				incrm_cntl = 1;
				decrm_cntl = 0;
				shift_cntl = 0;
				
				i_work_enable = 1;
				nsyst = 1;
				set = 0;
				
				fork
					
					forever #10 clk_50mhz = ~clk_50mhz;
					
					begin
						#5 		reset = ~reset;
						#10 	reset = ~reset;
						#10 	set = ~set;
						#10 	set = ~set;
						#100 	incrm_cntl = 0;
								shift_cntl = 1;
						#120 	shift_cntl = 0;
								decrm_cntl = 1;
						#60		i_work_enable = 0;
								decrm_cntl = 0;
						#40		nsyst = 0;
								i_work_enable = 1;
								incrm_cntl = 1;		
					end
					
				join
			end

endmodule
