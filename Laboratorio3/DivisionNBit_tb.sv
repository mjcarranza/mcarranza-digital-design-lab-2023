module DivisionNBit_tb;

    // Parámetros de prueba
    reg [3:0] num_input;
    reg [3:0] div_input;
    wire [3:0] res_output;
	 wire [3:0] i_output;

    // Instanciar el módulo SumaNBits
    DivisionNBit #(
        .n(4)
    ) dut (
        .num(num_input),
        .div(div_input),
        .res(res_output),
        .i(i_output)
    );

    // Generar estímulos
    initial begin

        // Prueba 1
        num_input = 4'b1111;
        div_input = 4'b0011;
        #40;
		  
		  $display("A\tB\tSum\tCout");
        $monitor("%b\t%b\t%b\t%b", num_input, div_input, res_output, i_output);
		  
		  // Prueba 1
        num_input = 4'b1111;
        div_input = 4'b0101;
        #40;
		  
		  $display("A\tB\tSum\tCout");
        $monitor("%b\t%b\t%b\t%b", num_input, div_input, res_output, i_output);
		  
		  // Prueba 1
        num_input = 4'b1011;
        div_input = 4'b0011;
        #40;
		  
		  $display("A\tB\tSum\tCout");
        $monitor("%b\t%b\t%b\t%b", num_input, div_input, res_output, i_output);
    

		end

endmodule
