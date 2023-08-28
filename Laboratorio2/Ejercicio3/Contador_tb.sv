module Contador_tb();

    // Señales de prueba
    logic reset = 0;
    logic button = 0;
    logic [6:0] display1;
    logic [6:0] display2;
    logic [6:0] display3;
    logic [6:0] display4;
    logic [6:0] display5;
    logic [6:0] display6;

    // Instancia del contador
    Contador #(6) dut (
        .btn(button),
		  .reset(reset),
        .display1(display1),
        .display2(display2), 
		  .display3(display3),
        .display4(display4),
        .display5(display5),
        .display6(display6)
    );

    // Estímulos de prueba
    initial begin
		reset = 1;
		#1;
		reset = 0;
		#10;
		
		button = 1;
		#1;
		button = 0;
		#10;
		button = 1;
		#1;
		button = 0;
		#10;
		button = 1;
		#1;
		button = 0;
		#10;
		button = 1;
		#1;
		button = 0;
		#10;
		button = 1;
		#1;
		button = 0;
		#10;
		button = 1;
		#1;
		button = 0;
		#10;
		button = 1;
		#1;
		button = 0;
		#10;
		button = 1;
		#1;
		button = 0;
		#10;
		button = 1;
		#1;
		button = 0;
		#10;
		button = 1;
		#1;
		button = 0;
		#10;
		button = 1;
		#1;
		button = 0;
		#10;
		button = 1;
		#1;
		button = 0;
		#10;
		button = 1;
		#1;
		button = 0;
		#10;
		button = 1;
		#1;
		button = 0;
		#10;
		button = 1;
		#1;
		button = 0;
		#10;
		button = 1;
		#1;
		button = 0;
		#10;
		button = 1;
		#1;
		button = 0;
		#10;
		button = 1;
		#1;
		button = 0;
		#10;
		button = 1;
		#1;
		button = 0;
		#10;
		button = 1;
		#1;
		button = 0;
		#10;
		
		reset = 1;
		#1;
		reset = 0;
		#10;
		
		button = 1;
		#1;
		button = 0;
		#10;
		button = 1;
		#1;
		button = 0;
		#10;
		button = 1;
		#1;
		button = 0;
		#10;
		button = 1;
		#1;
		button = 0;
		#10;
    end

endmodule
