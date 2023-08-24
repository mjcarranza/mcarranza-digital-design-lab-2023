module Contador_tb();
	logic a , b; 
	logic [6:0] dis1, dis2, dis3, dis4, dis5, dis6;	
	Contador #(6) cont(a, b, dis1, dis2, dis3, dis4, dis5, dis6);
	
	initial begin
	a=1;
	#40;
	a=0;
	#40;
	end
	


endmodule 