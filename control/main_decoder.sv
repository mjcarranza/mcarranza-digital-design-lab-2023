module main_decoder(
input logic [1:0] Op,
input logic Funct0,
input logic Funct5,
output logic Branch,
output logic MemtoReg,
output logic MemW,
output logic ALUSrc,
output logic [1:0] ImmSrc,
output logic RegW,
output logic [1:0] RegSrc,
output logic ALUOp
);

assign Branch = (Op == 2'b10);
assign MemtoReg = Funct0 & (Op == 2'b01); 
assign MemW = ~Funct0 & (Op == 2'b01);
assign ALUSrc = ~((Op == 2'b00) & ~Funct5); // no sirve 
assign ImmSrc = Op;
assign RegW = (Op == 2'b00) || ((Op == 2'b01) & Funct0);
assign ALUOp = (Op == 2'b00);
assign RegSrc = ((Op == 2'b00) & ~Funct5) ? 2'b00 : 
					((Op == 2'b00 & Funct5) || (Op == 2'b01 & Funct0)) ? 2'b10 : 
					((Op == 2'b01 ) & ~Funct0) ? 2'b10 :
					(Op == 2'b10) ? 2'b11 : 
					2'b11;

endmodule