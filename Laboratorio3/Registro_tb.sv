
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
    
    enable = 0;  // Deshabilitar registro
    #1;   		  // Esperar un ciclo de reloj

    // Finalizar la simulación
    $finish;
  end

  // Comprobar resultados
  always @(posedge enable) begin
    if (enable) begin
      if (salida !== data) begin
        $display("ERROR: Datos incorrectos en la salida. Esperado: %h, Obtenido: %h", data, salida);
      end else begin
        $display("Datos cargados correctamente en la salida: %h", salida);
      end
    end
  end

endmodule
