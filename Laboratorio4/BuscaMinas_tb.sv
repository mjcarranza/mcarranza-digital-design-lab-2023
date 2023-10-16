module BuscaMinas_tb;

	reg clk, rst, inicio;
   logic [3:0] switches_bombas;
   logic [6:0] display_0, display_6;
	
   BuscaMinas uut (
        .clk(clk),
        .rst(rst),
        .inicio(inicio),
        .switches_bombas(switches_bombas),
        .display_0(display_0),
        .display_6(display_6)
    );

    // Clock generation
    always #5 clk = ~clk;

    initial begin
        clk = 0;
        rst = 1;
		  inicio = 0;
        #10; 
		  
		  rst = 0;
		  #10;
		  
		  switches_bombas = 4'b0011;
		  #10;
		  
		  switches_bombas = 4'b0111;
		  #10;
		  
		  switches_bombas = 4'b0001;
		  #10;
		  
		  switches_bombas = 4'b1001;
		  #10;
		  
		  switches_bombas = 4'b1001;
		  #10;
		  
		  inicio = 1;
		  #10;
        
    end

endmodule
