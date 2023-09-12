module CompuertaXOR 
	#(parameter N=4) 
	(
	input logic [N-1:0] iA, iB, 
	output logic [N-1:0] oS   
	);
		
	always_comb
	begin 
		for(int i = 0; i < N; i = i + 1)
		begin 
	
			oS[i] = iA[i] ^ iB[i];
		end
	
	end 

endmodule 