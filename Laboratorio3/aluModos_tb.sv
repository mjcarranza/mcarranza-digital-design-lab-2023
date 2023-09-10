module aluModos_tb();

    // Señales de prueba
    logic start = 1;
    logic button = 1;
    logic [6:0] display1;
    logic [6:0] display2;
    logic [6:0] display3;
    logic [6:0] display4;
    logic [6:0] display5;
    logic [6:0] display6;
	 
	 aluModos #(4) dut (
        .selector(button),
		  .start(start),
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
		button = 0;
		#1;
		button = 1;
		#10;
		button = 0;
		#1;
		button = 1;
		#10;
		button = 0;
		#1;
		button = 1;
		#10;
		button = 0;
		#1;
		button = 1;
		#10;
		button = 0;
		#1;
		button = 1;
		#10;
		button = 0;
		#1;
		button = 1;
		#10;
		
		
		start = 0;
		#1;
		start = 1;
		#10;
		
		button = 0;
		#1;
		button = 1;
		#10;
		button = 0;
		#1;
		button = 1;
		#10;
		button = 0;
		#1;
		button = 1;
		#10;
		button = 0;
		#1;
		button = 1;
		#10;
		button = 0;
		#1;
		button = 1;
		#10;
		
	 
    end

endmodule