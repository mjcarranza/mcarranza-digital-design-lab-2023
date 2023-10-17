module colocarMostrar(
  input reg [2:0] col,
  input reg [2:0] fila,
  input reg [7:0] seleccion_matriz [7:0], 
  input wire button_bomba, 
  output reg [7:0] matriz_salida [7:0]
);
	always @(negedge button_bomba) begin
		if (~button_bomba) begin
		
			$display("col:%d fila:%d", col, fila);
			for (int i = 0; i < 8; i++) begin
				matriz_salida[i] = seleccion_matriz[i];
			end
			
			if ((col-1) >=0 && (fila-1) >=0) matriz_salida[col-1][fila-1] = 1;
			if ((col-1) >=0 &&  fila >=0) 	matriz_salida[col-1][fila]   = 1;
			if ((col-1) >=0 && (fila+1) >=0) matriz_salida[col-1][fila+1] = 1;
			if (col >=0 && (fila-1) >=0) 		matriz_salida[col][fila-1]   = 1;
			if (col >=0 && fila >=0) 			matriz_salida[col][fila] 	  = 1;
			if (col >=0 && (fila+1) >=0) 		matriz_salida[col][fila+1]   = 1;
			if ((col+1) >=0 && (fila-1) >=0) matriz_salida[col+1][fila-1] = 1;
			if ((col+1) >=0 && fila >=0) 		matriz_salida[col+1][fila]   = 1;
			if ((col+1) >=0 && (fila+1) >=0) matriz_salida[col+1][fila+1] = 1;
			
		end
	end 

endmodule 
