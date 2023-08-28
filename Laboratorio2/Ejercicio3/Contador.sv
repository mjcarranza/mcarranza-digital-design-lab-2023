module Contador #(
    parameter int n = 19
)(
    input logic btn,
	 input logic reset,
    output logic [6:0] display1,
    output logic [6:0] display2, 
	 output logic [6:0] display3,
	 output logic [6:0] display4, 
	 output logic [6:0] display5, 
	 output logic [6:0] display6
);

    reg [23:0] count = 0;  // Número inicial
	 reg [23:0] temp = 0;  // Número inicial
	 reg [3:0] digitos[5:0];
	 reg [3:0] last_digit;

    always @(posedge btn or posedge reset) begin
		if (reset) begin
		count <= 2 * 0;
			for (int i = 0; i < n; i++) begin
				count <= count + (2 ** n);
			end
			$display("%d", count);
		end 
      else if (count > 0)
			count <= count - 1;
    end

    always @(count) begin
		temp = count;
		for (int i = 6; i > 0; i--) begin
			last_digit = temp % 10;
			case (last_digit)
            6'd0: digitos[i-1] = 4'b0000;
				6'd1: digitos[i-1] = 4'b0001;
				6'd2: digitos[i-1] = 4'b0010;
				6'd3: digitos[i-1] = 4'b0011;
				6'd4: digitos[i-1] = 4'b0100;
				6'd5: digitos[i-1] = 4'b0101;
				6'd6: digitos[i-1] = 4'b0110;
				6'd7: digitos[i-1] = 4'b0111;
				6'd8: digitos[i-1] = 4'b1000;
				6'd9: digitos[i-1] = 4'b1001;
				default: digitos[i-1] <= 4'b0000; // Apagar displays si el número está fuera de rango
        endcase
		  
		  $display("Dígito %d: Dígito %b: Decimal %d", last_digit, digitos[i-1], temp);
		  temp = temp/10;
		end 
    end
	 ejercicio1 dis1(
			.A(digitos[5][3]), 
			.B(digitos[5][2]), 
			.C(digitos[5][1]), 
			.D(digitos[5][0]), 
			.a(display1[0]), 
			.b(display1[1]), 
			.c(display1[2]), 
			.d(display1[3]), 
			.e(display1[4]), 
			.f(display1[5]), 
			.g(display1[6])
			);
	 ejercicio1 dis2(
			.A(digitos[4][3]), 
			.B(digitos[4][2]), 
			.C(digitos[4][1]), 
			.D(digitos[4][0]), 
			.a(display2[0]), 
			.b(display2[1]), 
			.c(display2[2]), 
			.d(display2[3]), 
			.e(display2[4]), 
			.f(display2[5]), 
			.g(display2[6])
			);
	ejercicio1 dis3(
			.A(digitos[3][3]), 
			.B(digitos[3][2]), 
			.C(digitos[3][1]), 
			.D(digitos[3][0]), 
			.a(display3[0]), 
			.b(display3[1]), 
			.c(display3[2]), 
			.d(display3[3]), 
			.e(display3[4]), 
			.f(display3[5]), 
			.g(display3[6])
			);
	ejercicio1 dis4(
			.A(digitos[2][3]), 
			.B(digitos[2][2]), 
			.C(digitos[2][1]), 
			.D(digitos[2][0]), 
			.a(display4[0]), 
			.b(display4[1]), 
			.c(display4[2]), 
			.d(display4[3]), 
			.e(display4[4]), 
			.f(display4[5]), 
			.g(display4[6])
			);
	ejercicio1 dis5(
			.A(digitos[1][3]), 
			.B(digitos[1][2]), 
			.C(digitos[1][1]), 
			.D(digitos[1][0]), 
			.a(display5[0]), 
			.b(display5[1]), 
			.c(display5[2]), 
			.d(display5[3]), 
			.e(display5[4]), 
			.f(display5[5]), 
			.g(display5[6])
			);
	ejercicio1 dis6(
			.A(digitos[0][3]), 
			.B(digitos[0][2]), 
			.C(digitos[0][1]), 
			.D(digitos[0][0]), 
			.a(display6[0]), 
			.b(display6[1]), 
			.c(display6[2]), 
			.d(display6[3]), 
			.e(display6[4]), 
			.f(display6[5]), 
			.g(display6[6])
			);
	 
endmodule
