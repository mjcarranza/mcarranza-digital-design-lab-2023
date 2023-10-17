module selecMinas(
  input wire [3:0] switch_data,
  input wire switch_inicio,
  output reg [7:0] matriz [7:0],
  output reg [2:0] bombas_adyacentes [0:7][0:7]
);

	reg [2:0] cola = 3'b001;
	reg [2:0] fil = 3'b001;
	reg [2:0] contador = 3'b000;

  integer i, j, col, fila, p;
  
  always_ff @(posedge switch_inicio) begin
    for (i = 0; i < 8; i = i + 1) begin
      for (j = 0; j < 8; j = j + 1) begin
			matriz[i][j] = 0;
      end
    end

    for (i = 0; i < switch_data; i = i + 1) begin
	 
		if (matriz[cola][fil] == 1) begin 
			cola = cola +1;
			matriz[cola][fil] = 1;
		end else matriz[cola][fil] = 1;
		
		
		for (p=0; p<3; p= p+1) begin
			if (cola > 7) cola = 0; else cola = cola+1;
		end
		
		for (p=0; p< switch_data; p = p+1) begin
			if (fil > 7) fil = 0; else fil = fil+1;
		end	
    end
	 
	 for (i = 0; i < 8; i = i + 1) begin
      $display("%b", matriz[i]);
    end
	 $display("b");
	 
	 
	 
	 for (col = 0; col < 8; col = col + 1) begin
      for (fila = 0; fila < 8; fila = fila + 1) begin
			contador = 0;
			
			if ((col-1) >=0 && (fila-1) >=0) begin
				if (matriz[col-1][fila-1] == 1) contador = contador + 1;
			end 
			
			
			if ((col-1) >=0 &&  fila >=0) begin 
				if (matriz[col-1][fila] == 1) contador = contador + 1;
			end 
			
			if ((col-1) >=0 && (fila+1) <8) begin 
				if(matriz[col-1][fila+1] == 1) contador = contador + 1;
			end
			
			
			if (col >=0 && (fila-1) >=0) begin 
				if(matriz[col][fila-1] == 1) contador = contador + 1;
			end
			
			
			if (col >=0 && (fila+1) <8) begin 
				if(matriz[col][fila+1] == 1) contador = contador + 1;
			end
			
			
			if ((col+1) <8 && (fila-1) >=0) begin
				if(matriz[col+1][fila-1] == 1) contador = contador + 1;
			end
			
			if ((col+1) <8 && fila >=0) begin
				if(matriz[col+1][fila] == 1) contador = contador + 1;
			end 
			
			if ((col+1) <8 && (fila+1) <8) begin 
				if(matriz[col+1][fila+1] == 1) contador = contador + 1;
			end
			
			bombas_adyacentes[col][fila] = contador;
			
			
      end
    end
	 
	 
	 
  end

endmodule
