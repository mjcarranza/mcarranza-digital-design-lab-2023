
module program_counter(input logic clk, rst,
								input logic [32-1:0] d,
								output logic [32-1:0] q);

always_ff @(posedge clk or negedge rst)
	if (rst == 0) q <= 0;
	else q <= d;

endmodule
