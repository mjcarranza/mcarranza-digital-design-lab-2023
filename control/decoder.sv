module decoder(
input logic [3:0] Rd,
input logic [1:0] Op,
input logic [5:0] Funct,
output logic RegW,
output logic MemW,
output logic MemtoReg,
output logic ALUSrc,
output logic Pcs,
output logic [1:0] ImmSrc,
output logic [1:0] RegSrc,
output logic [1:0] ALUControl,
output logic [1:0] FlagW,
output logic NoWrite
);

main_decoder main_deco_inst(Op, Funct[0], Funct[5], Branch, MemtoReg, MemW, ALUSrc, ImmSrc, RegW, RegSrc, ALUOp);

PCLogic pclogic_inst(Rd, Branch, RegW, Pcs);

alu_decoder alu_deco_inst(Funct[4:1], Funct[0], ALUOp, ALUControl, FlagW, NoWrite);

endmodule 