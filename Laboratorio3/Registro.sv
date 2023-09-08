
// modulo en el que se detallan cada una de las entradas del circuito
module Registro #(parameter N=2) (
  input wire [N-1:0] data,   // Entrada de datos de N bits
  input wire enable,         // Señal de habilitación para cargar datos
  output reg [N-1:0] salida  // Salida del registro de N bits
);

always @(posedge enable) 
begin
	if (enable) begin
		salida <=data;
	end
end

endmodule 