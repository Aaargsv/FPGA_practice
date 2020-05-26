module MUL

(
	input		logic [6:0]		seven_Hex [1:0],
	input		logic [6:0]		seven_Bin [5:0],
	
	input 	wire 				nsyst,
	
	output 	logic [6:0]		seven_Display [5:0]

);

	always_comb
	begin
		seven_Display <= seven_Bin;
		if (nsyst)
		begin
	
			seven_Display[0] <= seven_Hex[0];
			seven_Display[1] <= seven_Hex[1];
			
		end
	end
	
endmodule
				
			