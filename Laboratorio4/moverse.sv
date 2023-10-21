module moverse(
  input wire button_down,
  input wire button_right, 
  input wire button_bomba, 
  input wire button_bandera, 
  output reg [2:0] col = 0,
  output reg [2:0] fila = 0, 
  output reg poner_bomba, 
  output reg poner_bandera
  
);

	
	always @(negedge button_down or negedge button_right or negedge button_bomba  or negedge button_bandera) begin
		poner_bomba = 0;
		poner_bandera = 0;
		if (~button_down) begin 
			if (fila > 7) fila = 0; else fila = fila+1;
		end
		if (~button_right) begin 
			if (col > 7) col = 0; else col = col+1;
		end  
		if (~button_bomba) poner_bomba = 1;
		if (~button_bandera) poner_bandera = 1;
	end

endmodule
