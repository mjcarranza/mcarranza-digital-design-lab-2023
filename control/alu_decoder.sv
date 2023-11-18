module alu_decoder(
input logic [3:0]funct4_1,
input logic funct0,
input logic op,
output logic [1:0] alu_control,
output logic [1:0] flag,
output logic  noWrite
);
	assign flag = ((((funct4_1 == 4'b0100) || (funct4_1 == 4'b0010) || (funct4_1 == 4'b1010)) & funct0) & op) ? 2'b11 :
						((((funct4_1 == 4'b0000) || (funct4_1 == 4'b1100)) & funct0) & op) ? 2'b10 : 2'b00;

						
	assign alu_control = ((funct4_1 == 4'b0010)|| (funct4_1 == 4'b1010)) & op ? 2'b01 :
								(funct4_1 == 4'b0000) & op ? 2'b10 :
								(funct4_1 == 4'b1100) & op ? 2'b11 : 2'b00;
								
	
	assign noWrite = (funct4_1 == 4'b1010) & op & funct0;
	
	
endmodule


