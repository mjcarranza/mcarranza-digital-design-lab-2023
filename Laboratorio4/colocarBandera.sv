module colocarBandera(
  input reg [2:0] col,
  input reg [2:0] fila,
  input reg [7:0] banderas_matriz [7:0], 
  input wire button_bandera, 
  output reg [7:0] matriz_salida [7:0],
  output reg [3:0] cantidad_banderas = 0
);
	always @(negedge button_bandera) begin
		if (~button_bandera) begin
		
			$display("col:%d fila:%d", col, fila);
			for (int i = 0; i < 8; i++) begin
				matriz_salida[i] = banderas_matriz[i];
			end
		
		
			if (banderas_matriz[col][fila] == 1) begin 
				matriz_salida[col][fila] = 0;
			end 
			
			if (banderas_matriz[col][fila] == 0) begin 
				matriz_salida[col][fila] = 1;
			end 
			
			cantidad_banderas = 0;
			
			for (int i = 0; i < 8; i++) begin
				for (int j = 0; j < 8; j++) begin
					if (matriz_salida[i][j] == 1) cantidad_banderas = cantidad_banderas + 1;
				end
			end
		end
	end 

endmodule 
