module PCLogic(
input logic[3:0] Rd,
input logic branch,
input logic regW,
output logic pcs
);

assign pcs = ((Rd == 4'b1111) & regW) || branch;

endmodule