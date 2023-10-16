module colocarBandera_tb;
	
  reg [2:0] col;
  reg [2:0] fila;
  reg [7:0] banderas_matriz [7:0];
  reg [7:0] matriz_salida [7:0];
  reg [3:0] cantidad_banderas;
  
  colocarBandera uut (
	.col(col), 
	.fila(fila), 
	.banderas_matriz(banderas_matriz),
	.matriz_salida(matriz_salida),
	.cantidad_banderas(cantidad_banderas)
  );
  
  initial begin
	for (int i = 0; i < 8; i++) begin
		banderas_matriz[i] = 8'b00000000;
	end
	
	#10;
	
	col = 1;
	fila = 1;
	#1
	
	for (int i = 0; i < 8; i++) begin
		$display("%b", matriz_salida[i]);
		banderas_matriz[i] = matriz_salida[i];
	end
	$display("-");
	
	#10;
	
	col = 3;
	fila = 0;
	
	#1
	
	for (int i = 0; i < 8; i++) begin
		banderas_matriz[i] = matriz_salida[i];
		$display("%b", matriz_salida[i]);
	end
	$display("-");
	
	#10;
	
	col = 0;
	fila = 5;
	
	#1
	
	for (int i = 0; i < 8; i++) begin
		banderas_matriz[i] = matriz_salida[i];
		$display("%b", matriz_salida[i]);
	end	
	$display("-");
	
	#10;
	
	col = 1;
	fila = 1;
	
	#1
	
	for (int i = 0; i < 8; i++) begin
		banderas_matriz[i] = matriz_salida[i];
		$display("%b", matriz_salida[i]);
	end
	$display("-");
	
	#10;
	
  end


endmodule 