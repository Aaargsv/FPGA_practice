module HexDecoder

(
	
	input		logic [3:0]		i_data,
	input 		wire 			nsyst,
	
	output 		logic [6:0]		seven_Hex
	
);

	always_comb
			if (nsyst)
				case (i_data)
					0:  seven_Hex <= 7'b 1000000;
					1:  seven_Hex <= 7'b 1111001;
					2:  seven_Hex <= 7'b 0100100;
					3:  seven_Hex <= 7'b 0110000;
					4:  seven_Hex <= 7'b 0011001;
					5:  seven_Hex <= 7'b 0010010;
					6:  seven_Hex <= 7'b 0000010;
					7:  seven_Hex <= 7'b 1111000;
					8:  seven_Hex <= 7'b 0000000;
					9:  seven_Hex <= 7'b 0010000;
					10: seven_Hex <= 7'b 0001000;
					11: seven_Hex <= 7'b 0000011;
					12: seven_Hex <= 7'b 1000110;
					13: seven_Hex <= 7'b 0100001;
					14: seven_Hex <= 7'b 0000110;
					15: seven_Hex <= 7'b 0001110;
					default : 	 seven_Hex <= '1;
				endcase
			else 
				seven_Hex <= '1;
endmodule
			