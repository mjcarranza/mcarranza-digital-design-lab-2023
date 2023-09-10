module aluModos_tb();

    // Señales de prueba
    logic start = 1;
    logic button = 1;
	 logic reset =1;
    logic [6:0] display1;
    logic [6:0] display2;
    logic [6:0] display3;
    logic [6:0] display4;
    logic [6:0] display5;
    logic [6:0] display6;
	 
	 reg [3:0] A_input;
    reg [3:0] B_input;
	 
	 aluModos #(4) dut (
        .selector(button),
		  .start(start),
		  .reset(reset), 
		  .A(A_input),
        .B(B_input), 
        .display1(display1),
        .display2(display2), 
		  .display3(display3),
        .display4(display4),
        .display5(display5),
        .display6(display6)
    );
	 
	 
    initial begin
	 
		button = 0;
		#1;
		button = 1;
		#10;
		
		start = 0;
		#1;
		start = 1;
		
		$display("cambio");
		// Prueba 1
      A_input = 4'b0101;
      B_input = 4'b1100;
      #40;
		
		
		
		// Prueba 1
      A_input = 4'b1111;
      B_input = 4'b1111;
      #40;
		
		// Prueba 1
      A_input = 4'b1010;
      B_input = 4'b1111;
      #40;
		
		// Prueba 1
      A_input = 4'b0000;
      B_input = 4'b1000;
      #40;
		
		reset = 0;
		#1;
		reset = 1;
		
		start = 0;
		#1;
		start = 1;
		
		$display("cambio");
		// Prueba 1
      A_input = 4'b0101;
      B_input = 4'b1100;
      #40;
		
		// Prueba 1
      A_input = 4'b1111;
      B_input = 4'b1111;
      #40;
		
		// Prueba 1
      A_input = 4'b1010;
      B_input = 4'b1111;
      #40;
		
		// Prueba 1
      A_input = 4'b000;
      B_input = 4'b000;
      #40;
		
		
	
		
		

	 
    end

endmodule