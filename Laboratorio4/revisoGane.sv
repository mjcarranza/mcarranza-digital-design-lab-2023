module revisoGane (
	input reg [7:0] banderas_matriz [7:0],
	input reg [7:0] bombas_matriz [7:0],
	output reg gane
);

	always @(*) begin
		if (banderas_matriz == bombas_matriz) gane = 1; else gane = 0;
	end
endmodule
