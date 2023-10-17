module BuscaMinas_tb;

	reg clk, rst, inicio;
   logic [3:0] switches_bombas;
   logic [6:0] display_0, display_6;
	reg button_down, button_right, button_bomba, button_bandera;
	
   BuscaMinas uut (
        .clk(clk),
        .rst(rst),
        .inicio(inicio),
        .switches_bombas(switches_bombas),
        .display_0(display_0),
        .display_6(display_6),
		  .button_down(button_down), 
		  .button_right(button_right),
		  .button_bomba(button_bomba), 
		  .button_bandera(button_bandera)
    );

    // Clock generation
    always #1 clk = ~clk;

    initial begin
        clk = 0;
        rst = 1;
		  inicio = 0;
        #10; 
		  
		  rst = 0;
		  #10;

		  
		  switches_bombas = 4'b0001;
		  #10;
		  
		  inicio = 1;
		  #10;
		  inicio = 0;
		 
		  
        button_down = 0;
		  #1;
		  button_down = 1;
		  #10;
		  
		  button_bomba = 0;
		  #1;
		  button_bomba = 1;
		  #10;
		  
		  button_right = 0;
		  #1;
		  button_right = 1;
		  #10;
		  
		  button_bandera = 0;
		  #1;
		  button_bandera = 1;
		  #10;
		  
		  $display("Deberia de ganar");
		  
		  rst = 1;
		  #10;
		  
		  rst = 0;
		  #10;
		  
		  
		  switches_bombas = 4'b0010;
		  #10;
		  
		  inicio = 1;
		  #10;
		  inicio = 0;
		  
		  button_down = 0;
		  #1;
		  button_down = 1;
		  #10;
		  
		  button_right = 0;
		  #1;
		  button_right = 1;
		  #10;
		  
		  button_bandera = 0;
		  #1;
		  button_bandera = 1;
		  #10;
		  
		  button_down = 0;
		  #1;
		  button_down = 1;
		  #10;
		  
		  button_right = 0;
		  #1;
		  button_right = 1;
		  #10;
		  
		  button_bomba = 0;
		  #1;
		  button_bomba = 1;
		  #10;
		  $display("Deberia de perder");
		  
		 
		  
    end

endmodule
