module revisoBomba_tb;
	reg [2:0] col;
	reg [2:0] fila;
	reg [7:0] bombas_matriz [7:0];
	reg pierde;

	revisoBomba uut (
		.col(col), 
		.fila(fila), 
		.bombas_matriz(bombas_matriz), 
		.pierde(pierde)
	);

	initial begin 
		bombas_matriz[0] = 8'b00000000;
		bombas_matriz[1] = 8'b01000000;
		bombas_matriz[2] = 8'b00000000;
		bombas_matriz[3] = 8'b00000100;
		bombas_matriz[4] = 8'b00000000;
		bombas_matriz[5] = 8'b00100000;
		bombas_matriz[6] = 8'b00000000;
		bombas_matriz[7] = 8'b00000100;
		#1;
		
		col = 1;
		fila = 1;
		
		#10;
		
		col = 1;
		fila = 6;
		
		#10;
		
		
		col = 7;
		fila = 1;
		
		#10;
		
		col = 7;
		fila = 2;
		
		#10;
		
		
	end 

endmodule



