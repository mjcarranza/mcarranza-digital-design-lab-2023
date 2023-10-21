module colocarMostrar(
  input reg [2:0] col,
  input reg [2:0] fila,
  input reg [7:0] seleccion_matriz [7:0], 
  input wire button_bomba, 
  output reg [7:0] matriz_salida [7:0]
);
	always @(negedge button_bomba) begin
		if (~button_bomba) begin
			for (int i = 0; i < 8; i++) begin
				matriz_salida[i] = seleccion_matriz[i];
			end
			
			if (seleccion_matriz[col][fila] == 0) begin 
				matriz_salida[col][fila] = 1;
			end 
		end
	end 

endmodule 
