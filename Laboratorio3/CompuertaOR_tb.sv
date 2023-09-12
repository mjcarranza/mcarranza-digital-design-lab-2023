module CompuertaOR_tb;

	// Señales de prueba
	logic [3:0] A, B, S;

	// Instancia del módulo CompuertaAND
	CompuertaOR #(4) ORTest 
	(
		.iA(A),
		.iB(B),
		.oS(S)
	);

	// Generación de estímulos
	initial begin
	
		A = 4'b0000;
		B = 4'b0000;
		#50;

		A = 4'b0001; 
		B = 4'b0000;
		#50;
		
		A = 4'b0001;
		B = 4'b0001;
		#50;
		
		A = 4'b0010; 
		B = 4'b0000;
		#50;
		
		A = 4'b0010;
		B = 4'b0010;
		#50;
		
		A = 4'b1111;
		B = 4'b0000;
		#50;
		
		A = 4'b0000;
		B = 4'b1111;
		#50;
		
		A = 4'b1111;
		B = 4'b1111;
		#50;

	end

endmodule











