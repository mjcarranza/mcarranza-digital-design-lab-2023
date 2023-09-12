module MulNBit_tb;

    // Parámetros de prueba
    logic [1:0] A0;
    logic [1:0] B0;
    logic [2:0] Product0;

    // Instanciar el módulo MulNBits
    MulNBit #(
        .n(2)
    ) dut (
        .A(A0),
        .B(B0),
        .Product(Product0)
    );

    // Generar estímulos
    initial begin
       
        // Prueba 1
        A0 = 2'b11;
        B0 = 2'b10;
        #40;
		  
        // Prueba 2
        A0 = 2'b10;
        B0 = 2'b01;
        #40; 
        
    end

endmodule
