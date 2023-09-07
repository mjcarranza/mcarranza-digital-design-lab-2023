module Suma1Bit_tb();

    // Inputs
    logic A;
    logic B;
    logic Cin;
    
    // Outputs
    logic Sum;
    logic Cout;
    
    // Instantiate the module
    Suma1Bit dut (
        .A(A),
        .B(B),
        .Cin(Cin),
        .Sum(Sum),
        .Cout(Cout)
    );
	 
	 initial begin 
	 A= 0;
	 B= 0;
	 Cin=0;
	 #20;
	 
	 A= 0;
	 B= 1;
	 Cin=0;
	 #20;
	 
	 A= 1;
	 B= 1;
	 Cin=0;
	 #20;
	 
	 
	 
	 end
endmodule