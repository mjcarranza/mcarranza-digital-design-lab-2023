module DivisionNBit #(
    parameter int n = 4
)(
    input logic [n-1:0] num,
    input logic [n-1:0] div,
    output logic [n-1:0] res,
    output logic [n-1:0] i
);
	 reg [n-1:0] temp;
    reg [32:0] counter=4'b0001;

	 always @(num or div) begin 
		temp = num;
		counter = 4'b0000;
		while (temp >= div && counter < 16'b1111) begin
			temp = temp - div;
			counter = counter + 1;
		end
	 end
	 
	 assign i = counter; 
	 assign res = temp; 
	 
endmodule
