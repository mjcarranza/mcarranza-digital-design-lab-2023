module colocarMostrar_tb;
	
  reg [2:0] col;
  reg [2:0] fila;
  reg [7:0] seleccion_matriz [7:0];
  wire button_bomba;
  reg [7:0] matriz_salida [7:0];
  
  colocarMostrar uut (
	.col(col), 
	.fila(fila), 
	.seleccion_matriz(seleccion_matriz),
	.matriz_salida(matriz_salida),
	.button_bomba(button_bomba)
  );
  
  initial begin
	for (int i = 0; i < 8; i++) begin
		seleccion_matriz[i] = 8'b00000000;
	end
	
	#10;
	
	col = 1;
	fila = 1;
	#1
	
	button_bomba = 0;
	#1;
	button_bomba = 1;
	#10;
	
	for (int i = 0; i < 8; i++) begin
		$display("%b", matriz_salida[i]);
		seleccion_matriz[i] = matriz_salida[i];
	end
	$display("-");
	
	#10;
	
	col = 3;
	fila = 0;
	
	#1
	
	button_bomba = 0;
	#1;
	button_bomba = 1;
	#10;
	
	for (int i = 0; i < 8; i++) begin
		$display("%b", matriz_salida[i]);
		seleccion_matriz[i] = matriz_salida[i];
	end
	$display("-");
	
	#10;
	
	col = 0;
	fila = 5;
	
	#1
	
	button_bomba = 0;
	#1;
	button_bomba = 1;
	#10;
	
	for (int i = 0; i < 8; i++) begin
		$display("%b", matriz_salida[i]);
		seleccion_matriz[i] = matriz_salida[i];
	end
	$display("-");
	
	#10;
	
	col = 1;
	fila = 1;
	
	#1
	
	button_bomba = 0;
	#1;
	button_bomba = 1;
	#10;
	
	for (int i = 0; i < 8; i++) begin
		$display("%b", matriz_salida[i]);
		seleccion_matriz[i] = matriz_salida[i];
	end
	$display("-");
	
	#10;
	
	
	
  end


endmodule 