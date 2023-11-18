module conditional_logic(
input clk, rst,
input logic Pcs,
input logic RegW,
input logic NoWrite,
input logic MemW,
input logic [1:0] FlagW,
input logic [3:0] Cond,
input logic [3:0] ALUFlags, 
output logic PCSrc,
output logic RegWrite,
output logic MemWrite
);

logic CondEx, not_noWrite;
logic [1:0] FlagWrite;
logic [3:0] Flags;

flopenr flagreg1(clk, rst, FlagWrite[1], ALUFlags[3:2], Flags[3:2]);
flopenr flagreg0(clk, rst, FlagWrite[0], ALUFlags[1:0], Flags[1:0]);


conditional_check cond_inst(Cond, Flags[0], Flags[1], Flags[2], CondEx);

assign FlagWrite = FlagW & {2{CondEx}};

and and_pcs(PCSrc, Pcs, CondEx);

not (not_noWrite, NoWrite);

and and_regWrite(RegWrite, RegW, not_noWrite, CondEx);

and(MemWrite, MemW, CondEx);

endmodule