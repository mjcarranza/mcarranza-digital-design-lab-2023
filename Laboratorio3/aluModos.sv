module aluModos #(
    parameter int n = 4
)(
    input logic selector,
	 input logic start,
    output logic [6:0] display1,
    output logic [6:0] display2, 
	 output logic [6:0] display3,
	 output logic [6:0] display4, 
	 output logic [6:0] display5, 
	 output logic [6:0] display6
);

    reg [n-1b :0] modo = 0;   
	 reg [n-1:0] digitos= 4'b0000;
	 logic flag = 0;

    always @(negedge selector or negedge start) begin
		if (start) begin
			if (modo < 9) begin
				modo <= modo + 1;
			end else begin
				
			end
		end else begin
			if (selector) begin
				if (modo == 0)begin
				end
				if (modo == 1)begin
				end
				if (modo == 2)begin
				end
				if (modo == 3)begin
				end
				if (modo == 4)begin
				end
				if (modo == 5)begin
				end
				if (modo == 6)begin
				end
				if (modo == 7)begin
				end
				if (modo == 8)begin
				end
				if (modo == 9)begin
				end
			end
		end 
		
		
		
		
	end
	 
    always @(modo) begin
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
				default: digitos <= 4'b1111; // Apagar displays si el número está fuera de rango
        endcase
    end
	 
	 
	 decodificador_modos disp(
			.A(digitos[3]), 
			.B(digitos[2]), 
			.C(digitos[1]), 
			.D(digitos[0]), 
			.a(display1[6]), 
			.b(display1[5]), 
			.c(display1[4]), 
			.d(display1[3]), 
			.e(display1[2]), 
			.f(display1[1]), 
			.g(display1[0])
			);
	 
endmodule