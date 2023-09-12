module aluModos #(
    parameter int n = 4
)(
    input logic selector,
	 input logic start,
	 input logic reset,
    input logic [n-1:0] A,
    input logic [n-1:0] B,
    output logic [6:0] display1,
    output logic [6:0] display2, 
	 output logic [6:0] display3,
	 output logic [6:0] display4, 
	 output logic [6:0] display5, 
	 output logic [6:0] display6
);

    reg [3:0] modo = 0;   
	 reg [3:0] digitos;
	 reg [3:0] resultados[9:0];
	 reg [3:0] acarreo = 4'b1111;
	 reg [3:0] negativo = 4'b1111;
	 reg [3:0] cero = 4'b1111;
	 reg [3:0] desbordamiento = 4'b1111;
	 reg [1:0] deco = 2'b00;
	 reg flag = 0;
	 reg [3:0] digitos_temp= 4'b0000;
	 reg [3:0] flags;
	 
	 initial begin
		 for (int i = 0; i < 10; i = i + 1) begin
			  resultados[i] = 4'b0000;
		 end
	end

    always @(negedge selector or negedge start or negedge reset) begin
	 #1
		if (~reset) begin
			deco <= 2'b00;
			modo <= 0;
			flag <= 0;		
		end else if (~selector) begin
			if (modo < 9) begin
				modo <= modo + 1;
			end else begin
				modo <=0;
			end
		end else begin
			if (~start) begin
				deco <= 2'b11;
				flag <= 1;
			end
		end 
	end
	 
    always @(*) begin
		if (flag) begin
			desbordamiento <= 4'b1111;
			cero <= 4'b1111;
			acarreo <= 4'b1111;
			negativo <= 4'b1111;		  
		  
			case (modo)
				6'd0: begin
					digitos_temp = resultados[0];
					if (flags[2]) begin
						acarreo <= 4'b0101;
					end
				end
				
				6'd1: begin 
					digitos_temp = resultados[1];
					if (flags[3]) begin
						negativo <= 4'b0001;
					end
				end
				
				6'd3: begin 
					digitos_temp = resultados[3];
				end
				
				6'd4: begin 
					digitos_temp = resultados[4];
				end
				
				6'd5: begin 
					$display("AND %b", resultados[5]);
					digitos_temp = resultados[5];
				end
				
				6'd6: begin 
					$display("OR %b", resultados[6]);
					digitos_temp = resultados[6];
				end
				
				6'd7: begin 
					$display("XOR %b", resultados[7]);
					digitos_temp = resultados[7];
				end
				
				6'd8: begin 
					$display("LEFT %b", resultados[8]);
					digitos_temp = resultados[8];
				end
				
				6'd9: begin 
					$display("RIGHT %b", resultados[9]);
					digitos_temp = resultados[9];
				end
				
				
				
				default: begin
					digitos_temp = resultados[0]; 
				end // Apagar displays si el número está fuera de rango
        endcase 
		end 
		else begin
		$display("%b: %b", digitos, display1);
			case (modo)
            6'd0: digitos = 4'b0000;
				6'd1: digitos = 4'b0001;
				6'd2: digitos = 4'b0010;
				6'd3: digitos = 4'b0011;
				6'd4: digitos = 4'b0100;
				6'd5: digitos = 4'b0101;
				6'd6: digitos = 4'b0110;
				6'd7: digitos = 4'b0111;
				6'd8: digitos = 4'b1000;
				6'd9: digitos = 4'b1001;
				default: digitos = 4'b1111; // Apagar displays si el número está fuera de rango
        endcase
		  digitos_temp = digitos;
		  acarreo = 4'b1111;
		  negativo = 4'b1111;
		  cero = 4'b1111;
		  desbordamiento = 4'b1111;
		  
		  
		end
    end
	 
	 SumaNBit #(
        .n(n)
    ) dutSum (
        .A(A),
        .B(B),
        .Sum(resultados[0]),
        .Cout(flags[2])
    );
	 
	 RestadorNBit #(
        .n(n
		  )
    ) dutRes (
        .A(A),
        .B(B),
        .resta(resultados[1]),
        .Cout(flags[3])
    );
	 
	 DivisionNBit #(
        .n(n)
    ) dutDiv (
        .num(A),
        .div(B),
        .i(resultados[3])
    );
	 
	 DivisionNBit #(
        .n(n)
    ) dutMod (
        .num(A),
        .div(B),
        .res(resultados[4])
    );
	 
	 CompuertaAND #(n) dutAND (
		.iA(A),
		.iB(B),
		.oS(resultados[5])
	 );
	 
	 CompuertaOR #(n) dutOR (
		.iA(A),
		.iB(B),
		.oS(resultados[6])
	 );
	 
	 CompuertaXOR #(n) dutXOR (
		.iA(A),
		.iB(B),
		.oS(resultados[7])
	 );
	 
	 shiftLeft #(n) dutLeft (
		.data_in(A),
		.data_out(resultados[8])
	 );
	 
	 shiftRight #(n) dutRight (
		.data_in(A),
		.data_out(resultados[9])
	 );
	 
	 decodificador_modos disp(
			.mode(deco),
			.A(digitos_temp[3]), 
			.B(digitos_temp[2]), 
			.C(digitos_temp[1]), 
			.D(digitos_temp[0]), 
			.a(display1[6]), 
			.b(display1[5]), 
			.c(display1[4]), 
			.d(display1[3]), 
			.e(display1[2]), 
			.f(display1[1]), 
			.g(display1[0])
			);
			
	  decodificador_modos disp2(
			.mode(2'b00),
			.A(1), 
			.B(1), 
			.C(1), 
			.D(1), 
			.a(display2[6]), 
			.b(display2[5]), 
			.c(display2[4]), 
			.d(display2[3]), 
			.e(display2[2]), 
			.f(display2[1]), 
			.g(display2[0])
			);
			
			
	 decodificador_modos flagDes(
			.mode(2'b00),
			.A(desbordamiento[3]), 
			.B(desbordamiento[2]), 
			.C(desbordamiento[1]), 
			.D(desbordamiento[0]), 
			.a(display6[6]), 
			.b(display6[5]), 
			.c(display6[4]), 
			.d(display6[3]), 
			.e(display6[2]), 
			.f(display6[1]), 
			.g(display6[0])
			);
	 decodificador_modos flagCero(
			.mode(2'b00),
			.A(cero[3]), 
			.B(cero[2]), 
			.C(cero[1]), 
			.D(cero[0]), 
			.a(display5[6]), 
			.b(display5[5]), 
			.c(display5[4]), 
			.d(display5[3]), 
			.e(display5[2]), 
			.f(display5[1]), 
			.g(display5[0])
			);
					
	 decodificador_modos flagAca(
			.mode(2'b00),
			.A(acarreo[3]), 
			.B(acarreo[2]), 
			.C(acarreo[1]), 
			.D(acarreo[0]), 
			.a(display4[6]), 
			.b(display4[5]), 
			.c(display4[4]), 
			.d(display4[3]), 
			.e(display4[2]), 
			.f(display4[1]), 
			.g(display4[0])
			);
			
	 decodificador_modos flagNeg(
			.mode(2'b00),
			.A(negativo[3]), 
			.B(negativo[2]), 
			.C(negativo[1]), 
			.D(negativo[0]), 
			.a(display3[6]), 
			.b(display3[5]), 
			.c(display3[4]), 
			.d(display3[3]), 
			.e(display3[2]), 
			.f(display3[1]), 
			.g(display3[0])
			);
						
	
	 
endmodule