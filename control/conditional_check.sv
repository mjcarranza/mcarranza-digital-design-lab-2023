module conditional_check(
input logic[3:0] cond,
input logic cout,
input logic negative,
input logic zero,
output logic condEx
);


logic condEx_out;
	always @(*) begin
	
		case (cond)

			4'b0000: condEx_out = zero; // EQ
			4'b0001: condEx_out = ~zero; // NE
			4'b1010: condEx_out = ~negative | zero; // GE
			4'b1100: condEx_out = ~negative & ~zero;
			4'b1110: condEx_out = 1'b1;
			default: condEx_out = 1'b0;
					
		endcase
	
	end
	
	assign condEx = condEx_out;
	
endmodule
 