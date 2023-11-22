module cpu(input logic clkFPGA, rst,
			output logic vgaclk, // 25.175 MHz VGA clock
			output logic hsync, vsync,
			output logic sync_b, blank_b, // To monitor & DAC
			output logic [7:0] r, g, b);

logic [31:0] pc, pc_out, Inst, RD1, RD2, ExtImm, SrcA, SrcB, ALUResult, ReadData, Result, PCPlus1, PCPlus2;
logic PCSrc, MemtoReg, MemWrite, RegWrite, cout, negative, zero, ALUSrc;
logic [1:0] ImmSrc, RegSrc, ALUControl;
logic [3:0] RA1, RA2;

logic clk, clk_mem, clk_rom;

// mod frecuencia para memoria
new_clk #(.frec(1)) frec_mem (clk_mem, clkFPGA);
new_clk #(.frec(2)) frec_rom (clk_rom, clkFPGA);
new_clk #(.frec(16)) frec_clk (clk, clkFPGA);

// mod 14
mux2_1 #(.width(32)) mux_pc(.data0(PCPlus1), .data1(Result), .select(PCSrc), .result(pc));

// mod 1
//program_counter pc_inst(clk, ~rst, 1'b1, pc, pc_out);
program_counter pc_inst(.clk(clk), .rst(~rst), .d(pc), .q(pc_out));

//mod 2
rom1 rom_inst(.address(pc_out[7:0]), .clock(clk_rom), .q(Inst));

// mod 3
control_unit contol_inst(.clk(clk), .rst(rst), .Cond(Inst[31:28]), .ALUFlags({negative, zero, cout, 1'b0}), .Op(Inst[27:26]),
				.Funct(Inst[25:20]), . Rd(Inst[15:12]), .PCSrc(PCSrc), .RegWrite(RegWrite), 
				.MemWrite(MemWrite), .MemtoReg(MemtoReg),  .ALUSrc(ALUSrc), .ImmSrc(ImmSrc), 
				.RegSrc(RegSrc), .ALUControl(ALUControl));
				

// mod 4
adder add_1_pc(pc_out, 32'd1, PCPlus1);

// mod 5
adder add_2_pc(32'd1, PCPlus1, PCPlus2);

// mod 6				
mux2_1 #(.width(4)) mux_RA1(.data0(Inst[19:16]), .data1(4'b1111), .select(RegSrc[0]), .result(RA1));

// mod 7
mux2_1 #(.width(4)) mux_RA2(.data0(Inst[3:0]), .data1(Inst[15:12]), .select(RegSrc[1]), .result(RA2));


// mod 8		
	
register_file reg_inst(.clk(clk), .rst(rst), .A1(RA1), .A2(RA2), .A3(Inst[15:12]), .WD3(Result), 
								.R15(PCPlus2), .WE3(RegWrite), .RD1(RD1), .RD2(RD2));
/*	
register_fileV2 reg_inst(.clk(clk), .reset(rst), .A1(RA1), .A2(RA2), .A3(Inst[15:12]), .WD3(Result), 
								.RI15(PCPlus2), .wr_enable(RegWrite), .RD1(RD1), .RD2(RD2)); 
			
*/			
// mod 9								
extend ext_inst(.Instr(Inst[23:0]), .ImmSrc(ImmSrc), .ExtImm(ExtImm));

// mod 10
mux2_1 #(.width(32)) mux_SrcB(.data0(RD2), .data1(ExtImm), .select(ALUSrc), .result(SrcB)); 

// mod 11
alu  alu_inst(.A(RD1), .B(SrcB), .sel(ALUControl), .carry(cout), 
									.negative(negative), .zero(zero), .alu_out(ALUResult));

// mod 12
//ram2 mem(.address(ALUResult[15:0]), .clock(clk), .data(RD2), .wren(1'b1), .q(ReadData)); // cambie el clk a lo contrario e igual no funciono
ram1 mem(.address(ALUResult[15:0]), .clock(clk_mem), .data(RD2), .wren(MemWrite), .q(ReadData)); // cambie el clk a lo contrario e igual no funciono

// mod 13
mux2_1 #(.width(32)) mux_result(.data1(ReadData), .data0(ALUResult), .select(MemtoReg), .result(Result)); 


//instancia de VGA
vga vga_inst(clkFPGA, rst, vgaclk, hsync, vsync, sync_b, blank_b, r, g, b);



endmodule 