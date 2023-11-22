module Contador(
   input logic clk,   // Entrada de reloj
   input logic reset, // Entrada de reinicio
   output logic [13:0] count // Salida del contador de 0 a 10000
);

   // Registros internos
   logic [13:0] counter;

   always_ff @(posedge clk or posedge reset) begin
      if (reset) begin
         // Reiniciar el contador en caso de señal de reinicio
         counter <= 14'b0;
      end else begin
         // Incrementar el contador en cada flanco de subida del reloj
         if (counter == 14'd10000) begin
            // Reiniciar el contador cuando alcanza el valor 10000
            counter <= 14'b0;
         end else begin
            counter <= counter + 1;
         end
      end
   end

   // Asignar la salida del contador
   assign count = counter;

endmodule
