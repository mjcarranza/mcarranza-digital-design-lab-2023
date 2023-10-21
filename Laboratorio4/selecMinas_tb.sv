module selecMinas_tb;

  reg [3:0] switch_data;
  reg switch_inicio;
  reg [7:0] matriz [7:0];
  reg [2:0] bombas_adyacentes [0:7][0:7];

  selecMinas uut (
    .switch_data(switch_data),
    .switch_inicio(switch_inicio),
    .matriz(matriz),
	 .bombas_adyacentes(bombas_adyacentes)
  );

  initial begin
    switch_data = 4'b0000;
    switch_inicio = 0;	 
    #10; 

    switch_data = 4'b0101;
	 #10; 
	 
	 switch_inicio = 1; 
	 #20;
	 switch_inicio = 0;	
	 #10
	 
	 switch_data = 4'b1001;
    #10; 
	 
	 switch_inicio = 1; 
	 #20;
	 switch_inicio = 0;	
	 #10

    switch_data = 4'b0011;
	 #10; 
	 
	 switch_inicio = 1; 
	 #20;
	 
	 switch_inicio = 0;	
	 #10

    switch_data = 4'b1111;
	 #10; 
	 
	 switch_inicio = 1; 
	 #20;
  end

endmodule
