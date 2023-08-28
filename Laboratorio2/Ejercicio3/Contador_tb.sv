module Contador_tb();

    // Señales de prueba
    logic resetd1 = 0;
    logic buttond1 = 0;
    logic [6:0] display1d1;
    logic [6:0] display2d1;
    logic [6:0] display3d1;
    logic [6:0] display4d1;
    logic [6:0] display5d1;
    logic [6:0] display6d1;
	 
	 logic resetd2 = 0;
    logic buttond2 = 0;
    logic [6:0] display1d2;
    logic [6:0] display2d2;
    logic [6:0] display3d2;
    logic [6:0] display4d2;
    logic [6:0] display5d2;
    logic [6:0] display6d2;
	 
	 logic resetd3 = 0;
    logic buttond3 = 0;
    logic [6:0] display1d3;
    logic [6:0] display2d3;
    logic [6:0] display3d3;
    logic [6:0] display4d3;
    logic [6:0] display5d3;
    logic [6:0] display6d3;
	 
	 Contador #(6) dut (
        .btn(buttond1),
		  .reset(resetd1),
        .display1(display1d1),
        .display2(display2d1), 
		  .display3(display3d1),
        .display4(display4d1),
        .display5(display5d1),
        .display6(display6d1)
    );
	 Contador #(4) dut2 (
        .btn(buttond2),
		  .reset(resetd2),
        .display1(display1d2),
        .display2(display2d2), 
		  .display3(display3d2),
        .display4(display4d2),
        .display5(display5d2),
        .display6(display6d2)
    );
	 Contador #(2) dut3 (
        .btn(buttond3),
		  .reset(resetd3),
        .display1(display1d3),
        .display2(display2d3), 
		  .display3(display3d3),
        .display4(display4d3),
        .display5(display5d3),
        .display6(display6d3)
    );
	 
	 
    initial begin
	 
		resetd1 = 1;
		#1;
		resetd1 = 0;
		#10;
		buttond1 = 1;
		#1;
		buttond1 = 0;
		#10;
		buttond1 = 1;
		#1;
		buttond1 = 0;
		#10;
		buttond1 = 1;
		#1;
		buttond1 = 0;
		#10;
		resetd1 = 1;
		#1;
		resetd1 = 0;
		#10;
		buttond1 = 1;
		#1;
		buttond1 = 0;
		#10;
		
		resetd2 = 1;
		#1;
		resetd2 = 0;
		#10;
		buttond2 = 1;
		#1;
		buttond2 = 0;
		#10;
		buttond2 = 1;
		#1;
		buttond2 = 0;
		#10;
		buttond2 = 1;
		#1;
		buttond2 = 0;
		#10;
		resetd2 = 1;
		#1;
		resetd2 = 0;
		#10;
		buttond2 = 1;
		#1;
		buttond2 = 0;
		#10;
		
		resetd3 = 1;
		#1;
		resetd3 = 0;
		#10;
		buttond3 = 1;
		#1;
		buttond3 = 0;
		#10;
		buttond3 = 1;
		#1;
		buttond3 = 0;
		#10;
		buttond3 = 1;
		#1;
		buttond3 = 0;
		#10;
		resetd3 = 1;
		#1;
		resetd3 = 0;
		#10;
		buttond3 = 1;
		#1;
		buttond3 = 0;
		#10;
	 
    end

endmodule
