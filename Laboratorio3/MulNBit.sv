module MulNBit #(parameter n = 4) (
	 input logic [n-1:0] A, B, 
	 output logic [2*n-1:0] Product
	 );
	 	 
    always_comb
	 begin
        Product = 0;
		  
        for (int i = 0; i < n; i = i + 1) 
		  begin
				Product = (B[i]) ? Product + (A << i) : Product;
        end
    end
	 
endmodule 