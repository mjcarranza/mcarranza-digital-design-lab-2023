module MulNBit_tb;

    // Parámetros de prueba
    logic [3:0] A0;
    logic [3:0] B0;
    logic [3:0] Product0;

    // Instanciar el módulo MulNBits
    MulNBit #(
        .n(4)
    ) dut (
        .A(A0),
        .B(B0),
        .Product(Product0)
    );

    // Generar estímulos
    initial begin
       
        // Prueba 1
        A0 = 4'b1111;
        B0 = 4'b1000;
        #40;
		  
        // Prueba 2
        A0 = 4'b1010;
        B0 = 4'b0101;
        #40; 
        
    end

endmodule
