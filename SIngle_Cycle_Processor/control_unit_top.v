include "ALU_decoder.v"
inlcude "main_decoder.v"

module control_unit_top(zerp,op,funct3,funct7,PCSrc,RegWrite,ImmSrc,ALUSrc,MemWrite,ResultSrc,ALUControl);

    input [6:0] op;
    input [2:0] funct3;
    input zero,funct7;
    output RegWrite,ALUSrc,MemWrite,ResultSrc,PCSrc;
    output [1:0] ImmSrc;
    output [2:0] ALUControl;

    wire [1:0]ALUOp;
    wire branch;

   

    main_decoder Main_Decod(
                            .op(op),
                            .RegWrite(RegWrite),
                            .ImmSrc(ImmSrc),
                            .MemWrite(MemWrite),
                            .ResultSrc(ResultSrc),
                            .branch(branch),
                            .ALUSrc(ALUSrc),
                            .ALUOp(ALUOp)
    );

    alu_decoder ALU_Decod(
                          .ALUOp(ALUOp),
                          .funct3(funct3),
                          .funct7(funct7),
                          .op5(op),
                          .ALUControl(ALUControl)
    );

    assign PCSrc= branch & zero;

endmodule