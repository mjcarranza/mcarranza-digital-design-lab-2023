
module Registro_tb;

  // Parámetros del registro
  parameter N = 8;
  
  // Señales de prueba
  reg [N-1:0] data;
  reg enable;
  wire [N-1:0] salida;

  // Instancia del registro en paralelo
  Registro #(N) dut (
    .data(data),
    .enable(enable),
    .salida(salida)
  );


  initial begin
    // Inicializar señales de entrada
    data = 10101111; // se puede cambiar estos valores segun los bits de entrada
    enable = 0;

    enable = 1;  // Habilitar registro  
    #1; 			  // Esperar un ciclo de reloj	
	 
    data = 11111111;
    enable = 0;  // Deshabilitar registro
    #1;   		  // Esperar un ciclo de reloj
	 
	 data = 10000000;
	 enable = 0;  // Deshabilitar registro
    #1;   
	 
	 data = 10001100;
	 enable = 1;  // Deshabilitar registro
    #1;   


  end

endmodule
