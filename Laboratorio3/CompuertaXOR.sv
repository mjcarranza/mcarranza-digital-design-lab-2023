

module CompuertaXOR #(parameter N=4) (
  input wire [N-1:0] a, // Entradas de la compuerta XOR
  output wire out       // Salida de la compuerta XOR
);

  assign out = ^a; // La salida es la operación XOR de todas las entradas

endmodule
