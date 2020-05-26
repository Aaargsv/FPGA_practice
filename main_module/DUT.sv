module DUT
(

	input		wire				clk_50mhz,
	input		wire				reset,
		
	input		wire				incrm_cntl,
	input 		wire					decrm_cntl,
	input		wire				shift_cntl,
	
	input		wire				set,
	input		wire				i_work_enable,
	input		wire				nsyst,
	
	output 		logic [5:0]			data,
	output  	logic [6:0] 		seven_Display [5:0],
	
	output		wire				clk_1hz

); 
	logic [5:0] i_initial = 6'b 11_1110;
	
	logic [6:0]	seven_Bin [5:0];
	logic [6:0]	seven_Hex [1:0];
	
	logic [3:0]	connect_bus;
	
	ClockDivider clockDivider(.*);
	counter 		 Counter (.*, .clk(clk_1hz));
	
	HexDecoder	 hexDecoder1 (.i_data(data[3:0]), .seven_Hex(seven_Hex[0]), .nsyst);
	
	assign connect_bus[0] = data[4];
	assign connect_bus[1] = data[5];
	assign connect_bus[2] = 0;
	assign connect_bus[3] = 0;
	
	HexDecoder	 hexDecoder2 (.i_data(connect_bus), .seven_Hex(seven_Hex[1]), .nsyst);
	
	BinDecoder	 binDecoder (.i_data(data), .seven_Bin, .nsyst);
	
	MUL 			 mul  (.*);

endmodule