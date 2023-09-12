module RestadorNBit_tb;

    // Parámetros de prueba
    reg [3:0] A_input;
    reg [3:0] B_input;
    wire [3:0] resta_output;
    wire Cout_output;

    // Instanciar el módulo SumaNBits
    RestadorNBit #(
        .n(4)
    ) dut (
        .A(A_input),
        .B(B_input),
        .resta(resta_output),
        .Cout(Cout_output)
    );

    // Generar estímulos
    initial begin
        $display("A\tB\tSum\tCout");
        $monitor("%b\t%b\t%b\t%b", A_input, B_input, resta_output, Cout_output);

        // Prueba 1
        A_input = 4'b0101;
        B_input = 4'b1100;
        #40;
		  
		  $display("A\tB\tSum\tCout");
        $monitor("%b\t%b\t%b\t%b", A_input, B_input, resta_output, Cout_output);
		  
        // Prueba 1
        A_input = 4'b1111;
        B_input = 4'b1111;
        #40;
		  
		  $display("A\tB\tSum\tCout");
        $monitor("%b\t%b\t%b\t%b", A_input, B_input, resta_output, Cout_output);

        // Prueba 1
        A_input = 4'b1010;
        B_input = 4'b1111;
        #40;
		  
		  $display("A\tB\tSum\tCout");
        $monitor("%b\t%b\t%b\t%b", A_input, B_input, resta_output, Cout_output);

        // Prueba 1
        A_input = 4'b0001;
        B_input = 4'b0010;
        #40;
		  
		  // Prueba 1
        A_input = 4'b0001;
        B_input = 4'b0011;
        #40;
		  
		  // Prueba 1
        A_input = 4'b0001;
        B_input = 4'b0100;
        #40;
		  
		  // Prueba 1
        A_input = 4'b0001;
        B_input = 4'b0110;
        #40;
		  // Prueba 1
        A_input = 4'b0001;
        B_input = 4'b0111;
        #40;
		  
		  // Prueba 1
        A_input = 4'b0010;
        B_input = 4'b0011;
        #40;
		  
		  // Prueba 1
        A_input = 4'b0010;
        B_input = 4'b0100;
        #40;
		  
		  // Prueba 1
        A_input = 4'b0010;
        B_input = 4'b0110;
        #40;
		  // Prueba 1
        A_input = 4'b0010;
        B_input = 4'b0111;
        #40;

		  
		  // Prueba 1
        A_input = 4'b0011;
        B_input = 4'b0100;
        #40;
		  
		  // Prueba 1
        A_input = 4'b0011;
        B_input = 4'b0110;
        #40;
		  // Prueba 1
        A_input = 4'b0011;
        B_input = 4'b0111;
        #40;
		  
		  
        
        
    end

endmodule
