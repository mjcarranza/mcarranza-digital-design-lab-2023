

module shiftRight_tb;

  // Parámetros del módulo
  parameter N = 4;

  // Señales de prueba
  reg [N-1:0] a;
  wire [N-1:0] out;

  // Instancia del módulo shiftLeft
  shiftRight #(N) uut (
    .data_in(a),
    .data_out(out)
  );

  // Generación de estímulos
  initial begin
    $display("Iniciando simulación...");

    // Prueba con diferentes combinaciones de entradas
    a = 4'b0000;
    #10; // Esperar 10 unidades de tiempo

    a = 4'b0001;
    #10;

    a = 4'b0010;
    #10;

    a = 4'b0011;
    #10;
	 
	 a = 4'b0100;
    #10;
	 
	 a = 4'b0101;
    #10;
	 
	 a = 4'b0110;
    #10;
	 
	 a = 4'b0111;
    #10;
	 
	 a = 4'b1000;
    #10;
	 
	 a = 4'b1001;
    #10;
	 
	 a = 4'b1010;
    #10;
	 
	 a = 4'b1011;
    #10;
	 
	 a = 4'b1100;
    #10;
	 
	 a = 4'b1101;
    #10;
	 
	 a = 4'b1110;
    #10;
	 
	 a = 4'b1111;
    #10;

  end

endmodule