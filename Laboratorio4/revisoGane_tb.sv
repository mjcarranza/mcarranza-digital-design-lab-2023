module revisoGane_tb;
  reg [7:0] banderas_matriz [7:0] ;
  reg [7:0] bombas_matriz [7:0] ;
  reg gane;

  revisoGane uut (
    .banderas_matriz(banderas_matriz),
    .bombas_matriz(bombas_matriz),
    .gane(gane)
  );

  
  initial begin
    
    banderas_matriz[0] = 8'b00000000;
	 banderas_matriz[1] = 8'b00000000;
	 banderas_matriz[2] = 8'b00000000;
	 banderas_matriz[3] = 8'b00000000;
	 banderas_matriz[4] = 8'b00000000;
	 banderas_matriz[5] = 8'b00000000;
	 banderas_matriz[6] = 8'b00000000;
	 banderas_matriz[7] = 8'b00000000;
	 
	 bombas_matriz[0] = 8'b00000000;
	 bombas_matriz[1] = 8'b01000000;
	 bombas_matriz[2] = 8'b00000000;
	 bombas_matriz[3] = 8'b00000100;
	 bombas_matriz[4] = 8'b00000000;
	 bombas_matriz[5] = 8'b00100000;
	 bombas_matriz[6] = 8'b00000000;
	 bombas_matriz[7] = 8'b00000100;
	 #10;
	 
	 banderas_matriz[1] = 8'b01000000;
	 banderas_matriz[3] = 8'b00000100;
	 banderas_matriz[5] = 8'b00100000;
	 banderas_matriz[7] = 8'b00000100;
	 #10;
	 
	 
	 banderas_matriz[1] = 8'b00000000;
	 #10;
   
  end

endmodule
