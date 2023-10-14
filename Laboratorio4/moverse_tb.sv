module moverse_tb;


	reg button_down;
	reg button_right; 
	reg button_bomba;
	reg button_bandera;
	reg [2:0] col = 0;
	reg [2:0] fila = 0;
	reg poner_bomba;
	reg poner_bandera;

  moverse uut (
	.col(col), 
	.fila(fila), 
	.button_down(button_down), 
	.button_right(button_right),
	.button_bomba(button_bomba),
	.button_bandera(button_bandera), 
	.poner_bomba(poner_bomba),
	.poner_bandera(poner_bandera)
  );

  initial begin
	button_down = 1;
	button_right = 1;
	button_bomba = 1;
	button_bandera =1;
	
	poner_bomba= 0;
	poner_bandera=0;
	
	#1;
	$display("%d:%d | ban:%b | bom:%b", col, fila, poner_bandera, poner_bomba);
	#10;
	
	button_down = 0;
	#1;
	button_down = 1;
	$display("%d:%d | ban:%b | bom:%b", col, fila, poner_bandera, poner_bomba);
	#10;
	
	button_down = 0;
	#1;
	button_down = 1;
	$display("%d:%d | ban:%b | bom:%b", col, fila, poner_bandera, poner_bomba);
	#10;
	
	button_right = 0;
	#1;
	button_right = 1;
	$display("%d:%d | ban:%b | bom:%b", col, fila, poner_bandera, poner_bomba);
	#10;
	
	button_right = 0;
	#1;
	button_right = 1;
	$display("%d:%d | ban:%b | bom:%b", col, fila, poner_bandera, poner_bomba);
	#10;
	
	button_right = 0;
	#1;
	button_right = 1;
	$display("%d:%d | ban:%b | bom:%b", col, fila, poner_bandera, poner_bomba);
	#10;
	
	button_right = 0;
	#1;
	button_right = 1;
	$display("%d:%d | ban:%b | bom:%b", col, fila, poner_bandera, poner_bomba);
	#10;
	
	button_bomba = 0;
	#1;
	button_bomba = 1;
	$display("%d:%d | ban:%b | bom:%b", col, fila, poner_bandera, poner_bomba);
	#10;
	
	button_right = 0;
	#1;
	button_right = 1;
	$display("%d:%d | ban:%b | bom:%b", col, fila, poner_bandera, poner_bomba);
	#10;
	
	button_right = 0;
	#1;
	button_right = 1;
	$display("%d:%d | ban:%b | bom:%b", col, fila, poner_bandera, poner_bomba);
	#10;
	
	button_right = 0;
	#1;
	button_right = 1;
	$display("%d:%d | ban:%b | bom:%b", col, fila, poner_bandera, poner_bomba);
	#10;
	
	button_right = 0;
	#1;
	button_right = 1;
	$display("%d:%d | ban:%b | bom:%b", col, fila, poner_bandera, poner_bomba);
	#10;
	
	button_bandera = 0;
	#1;
	button_bandera = 1;
	$display("%d:%d | ban:%b | bom:%b", col, fila, poner_bandera, poner_bomba);
	#10;
	
	button_right = 0;
	#1;
	button_right = 1;
	$display("%d:%d | ban:%b | bom:%b", col, fila, poner_bandera, poner_bomba);
	#10;
	
	button_right = 0;
	#1;
	button_right = 1;
	$display("%d:%d | ban:%b | bom:%b", col, fila, poner_bandera, poner_bomba);
	#10;
  end

endmodule
