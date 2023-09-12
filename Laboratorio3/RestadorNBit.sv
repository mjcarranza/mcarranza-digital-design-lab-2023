module RestadorNBit #(
    parameter int n = 8
)(
    input logic [n-1:0] A,
    input logic [n-1:0] B,
    output logic [n-1:0] resta,
    output logic Cout
);
    reg [n:0] carry_out_intermediate=0;
	 logic flag = 0;
	 logic stop = 0;
	 reg [n-1:0] complemento =0;
    
    // Instancias de sumadores de 1 bit
    genvar i;
    generate
		for (i = 0; i < n; i = i + 1) begin: loop_01
			Restador1Bit res(
				.A(A[i]),
				.B(B[i]),
				.Cin(carry_out_intermediate[i]),
				.resta(complemento[i]),
            .Cout(carry_out_intermediate[i+1])
			);
		end
		assign Cout = carry_out_intermediate[n];
    endgenerate
	 
	 always @(*) begin
		if (Cout ==1) begin
			flag= 0;
			for (int i = 0; i < n; i = i + 1) begin
				if (flag) begin 
					resta[i]= ~complemento[i];
				end else begin 
					resta[i]= complemento[i];
					if (resta[i]==1 && flag == 0) begin 
						flag = 1;
					end
				end
			end
			$display("Num: %b Compl: %b", resta, complemento);
		end else begin
			for (int i = 0; i < n; i = i + 1) begin
				resta[i]= complemento[i];
			end
		end
	end
endmodule
