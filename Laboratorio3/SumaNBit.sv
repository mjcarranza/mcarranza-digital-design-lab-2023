module SumaNBit #(
    parameter int n = 8
)(
    input logic [n-1:0] A,
    input logic [n-1:0] B,
    output logic [n-1:0] Sum,
    output logic Cout
);
    reg [n:0] carry_out_intermediate=0;
    
    // Instancias de sumadores de 1 bit
    genvar i;
    generate
        for (i = 0; i < n; i = i + 1) begin: loop_01
            Suma1Bit sum(
                .A(A[i]),
                .B(B[i]),
                .Cin(carry_out_intermediate[i]),
					 .Sum(Sum[i]),
                .Cout(carry_out_intermediate[i+1])
            );
        end
    endgenerate
	
	assign Cout = carry_out_intermediate[n];
	
endmodule
