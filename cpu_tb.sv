
// Test bench para el módulo del CPU
module cpu_tb();

    // Entradas
    reg clkFPGA;
    reg rst;

    // Salidas
    reg [31:0] pc, pc_out, Inst, RD1, RD2, ExtImm, SrcA, SrcB, ALUResult, ReadData, Result, PCPlus1, PCPlus2;
    reg PCSrc, MemtoReg, MemWrite, RegWrite, cout, negative, zero, ALUSrc;
    reg [1:0] ImmSrc, RegSrc, ALUControl;
    reg [3:0] RA1, RA2;

    // Conectar el módulo principal
    cpu cpu_inst (
        .clkFPGA(clkFPGA), 
        .rst(rst),
        .pc(pc),
        .pc_out(pc_out),
        .Inst(Inst),
        .RD1(RD1),
        .RD2(RD2),
        .ExtImm(ExtImm),
        .SrcA(SrcA),
        .SrcB(SrcB),
        .ALUResult(ALUResult),
        .ReadData(ReadData),
        .Result(Result),
        .PCPlus1(PCPlus1),
        .PCPlus2(PCPlus2),
        .PCSrc(PCSrc),
        .MemtoReg(MemtoReg),
        .MemWrite(MemWrite),
        .RegWrite(RegWrite),
        .cout(cout),
        .negative(negative),
        .zero(zero),
        .ALUSrc(ALUSrc),
        .ImmSrc(ImmSrc),
        .RegSrc(RegSrc),
        .ALUControl(ALUControl),
        .RA1(RA1),
        .RA2(RA2)
    );

    // Generar un clock de prueba
    initial begin
        clkFPGA = 0;
        forever #5 clkFPGA = ~clkFPGA;
    end

    // Inicializar las entradas
    initial begin
        rst = 1;
        #10 rst = 0;

        // Inicializar la instrucción en la ROM como una instrucción ADD
        // Aquí asumimos que la instrucción está codificada como add rd, rs1, rs2
        pc = 0;
        {Inst[6:0], Inst[14:12], Inst[24:20]} = 7'b0000000; // Opcode: ADD
        {Inst[11:7], Inst[19:15], Inst[31:25]} = {5'd1, 5'd2, 5'd3}; // rd, rs1, rs2

        // Esperar un tiempo suficiente para la ejecución
        #100;

        // Verificar la salida esperada para la instrucción ADD
        if (Result !== RD1 + RD2) begin
            $display("Error: Resultado incorrecto para la instrucción ADD");
        end else begin
            $display("Instrucción ADD ejecutada correctamente");
        end

    end

endmodule
