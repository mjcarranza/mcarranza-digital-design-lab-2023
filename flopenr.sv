module flopenr
(input logic clk, reset, en,
input logic [2-1:0] d,
output logic [2-1:0] q);
always_ff @(posedge clk, posedge reset)
if (reset) q <= 0;
else if (en) q <= d;
endmodule