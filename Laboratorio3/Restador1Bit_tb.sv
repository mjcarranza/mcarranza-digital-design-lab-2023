module Restador1Bit_tb;

  // Declaración de señales de prueba
  logic A;
  logic B;
  logic Cin;
  logic resta;
  logic Cout;
  
  // Instancia del módulo bajo prueba
  Restador1Bit uut (
    .A(A),
    .B(B),
    .Cin(Cin),
    .resta(resta),
    .Cout(Cout)
  );

  // Inicialización de señales
  initial begin
    A = 0;
    B = 0;
    Cin = 0;
    
    // Realizar pruebas
    #10 
	 A = 1;
    #10 
	 
	 B = 1;
    #10 
	 
	 Cin = 0;
    #10 
	 
	 Cin = 1;
    #10 
	 
	 A = 0;
    #10 
	 
	 B = 1;
    #10 
	 
	 Cin = 0;
    #10 
	 
	 A = 1;
    #10 
	 
	 B = 0;
    #10 
	 
	 Cin = 1;
    
  end

endmodule
