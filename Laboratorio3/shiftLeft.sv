

module shiftLeft #(parameter N = 4) (
  input wire [N-1:0] data_in, // Entrada de N bits
  output wire [N-1:0] data_out // Salida de N bits
);

  assign data_out = data_in << 1;

endmodule
