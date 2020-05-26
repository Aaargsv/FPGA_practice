module ClockDivider
#(
		parameter frequency = 1	
)

(
	input 	wire 				clk_50mhz,
	input 	wire				reset,
	output	logic				clk_1hz
);
	
	localparam int lp_div_cnt = 50000000/(2*frequency);
	logic [25:0] counter;
	
	always_ff @(posedge clk_50mhz, negedge reset)
	begin
		if (~reset)
		begin
			counter <= 0;
			clk_1hz <= 0;
		end
		
		else
		begin
			counter <= counter + 1;
			if(counter == lp_div_cnt)
			begin
				counter <= 0;
				clk_1hz <= !clk_1hz;
			end
		end
	end 
endmodule 