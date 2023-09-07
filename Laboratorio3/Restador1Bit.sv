module Restador1Bit (
	input logic A,
	input logic B,
	input logic Cin,
	output logic resta,
	output logic Cout
);
	assign resta = A ^ (B ^ Cin);
	assign Cout =  (~A & B) + (~A & Cin) + (B & Cin);

endmodule
