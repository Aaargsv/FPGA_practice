module counter

(
	
	input		wire				clk,
	input		wire				reset,
		
	input		wire				incrm_cntl,
	input 		wire				decrm_cntl,
	input		wire				shift_cntl,
	
	input		wire				set,	
	input		logic [5:0]			i_initial,
	
	input		wire				i_work_enable,
	
	output		logic [5:0]			data
	
);

	always_ff @(posedge clk, negedge reset)
	
		if (~reset) 
			data <= 0; //сброс устройства
			
		else if (set)
			data <= i_initial; //инициация устройства
			
		else if (i_work_enable)
		begin
			
			if (incrm_cntl)
				data <= data + 1; //инкремент на 1
				
			else if (decrm_cntl)
				data <= data - 5; //декремент на 5
				
			else if (shift_cntl)
				data = {data[4:0], data[5]}; //циклический сдвиг влево на 1
		end
		
		else
			data <= data;
			
endmodule
			
		

	