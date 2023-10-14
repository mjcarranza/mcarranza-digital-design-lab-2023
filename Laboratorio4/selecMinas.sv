module selecMinas(
  input wire [3:0] switch_data,
  input wire switch_inicio,
  output reg [7:0] matrix [7:0]
);

	reg [2:0] col = 3'b000;
	reg [2:0] fila = 3'b010;

  integer i, j;
  
  always_ff @(posedge switch_inicio) begin
    for (i = 0; i < 8; i = i + 1) begin
      for (j = 0; j < 8; j = j + 1) begin
			matrix[i][j] <= 0;
      end
    end

    for (i = 0; i < switch_data; i = i + 1) begin
      matrix[col][fila] <= 1;
		if (col > 7) col = 0; else col = col+1;
		if (fila > 7) fila = 0; else fila = fila+1;
    end
  end

endmodule
