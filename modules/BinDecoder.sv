module BinDecoder

(
	
	input	 	logic [5:0]		i_data,
	input 		wire 			nsyst,
	
	output  	logic [6:0] 	seven_Bin [5:0]
	
	
);

	always_comb
	begin
		logic [2:0] i;
		for (i=0;i<6;i++)
		begin
			if (nsyst)
				seven_Bin[i] <= '1;
			else
				case (i_data[i])
					0:  seven_Bin[i] <= 7'b 1000000;
					1:  seven_Bin[i] <= 7'b 1111001;
				endcase			
		end
	end
endmodule
