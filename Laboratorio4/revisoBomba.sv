module revisoBomba(
	  input reg [2:0] col,
	  input reg [2:0] fila,
	  input reg [7:0] bombas_matriz [7:0],
	  output reg pierde
	  
);	

	always @(*) begin
		if (bombas_matriz[col][fila] == 1) pierde = 1; else pierde = 0; 
	end

endmodule
