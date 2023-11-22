module control_unit(
input logic clk, rst, 
input logic [3:0] Cond, 
input logic [3:0] ALUFlags,
input logic [1:0] Op,
input logic [5:0] Funct,
input logic [3:0] Rd, 

output logic PCSrc,
output logic RegWrite, 
output logic MemWrite,
output logic MemtoReg,
output logic ALUSrc, 
output logic [1:0] ImmSrc, 
output logic [1:0] RegSrc,
output logic [1:0] ALUControl
);

logic [1:0] FlagW;
logic Pcs, RegW, MemW, NoWrite;

decoder deco_inst(Rd, Op, Funct, RegW, MemW, MemtoReg, ALUSrc, Pcs, ImmSrc, RegSrc, ALUControl, FlagW, NoWrite);

conditional_logic cond_logic_inst(clk, rst, Pcs, RegW, NoWrite, MemW, FlagW, Cond, ALUFlags, PCSrc, RegWrite, MemWrite);

endmodule