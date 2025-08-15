inlcude "p_c.v"
include "instruction_memory.v"
include "register_file.v"
include "extend.v"
include "ALU_with_Flags.v"
include "control_unit_top.v"




module sc_top(clk,rst);

        input clk,rst;


        wire [31:0] PC_Top,Instr,PCPLUS4_TOP,PCTARGET_TOP,RD1_Top,RD2_Top,ImmExt_Top,PCNEXT_TOP,Result,SrcB,ALUResult_Top,ReadData_Top;
        wire PCSrc_Top,RegWrite_Top,ALUSrc_Top,MemWrite_Top,ResultSrc_Top,zero_Top;
        wire [1:0] ImmSrc_Top;
        wire [2:0] ALUControl_Top;

        


        p_c PC(.clk(clk),
                .rst(rst),
                .PC(PC_Top),
                .PC_NEXT(PCNEXT_TOP)
                );

                
       pc_adder PC_ADD(.a(PC_TOP),
                       .b(32'd4),
                       .c(PCPLUS4_TOP)
                       );

        mux MUX1(.a(PCPLUS4_TOP),
                 .b(PCTARGET_TOP),
                 .s(PCSrc_Top),
                 .c(PCNEXT_TOP)
                 ); 


        intsruction_memory IM(.rst(rst),
                        .clk(clk),
                        .A(PC_Top),
                        .RD(Instr)
        );

        reg_file RF(.rst(rst),
                        .clk(clk),
                        .WE3(RegWrite_Top),
                        .WD3(Result),
                        .A1(Instr[19:15]),
                        .A2(Instr[24:20]),
                        .A3(Instr[11:7]),
                        .RD1(RD1_Top),
                        .RD2(RD2_Top)
        );

        control_unit_top CU_TOP(.RegWrite(RegWrite_Top),
                                .ALUSrc(ALUSrc_Top),
                                .MemWrite(MemWrite_Top),
                                .ResultSrc(ResultSrc_Top),
                                .PCSrc(PCSrc_Top),
                                .ImmSrc(ImmSrc_Top),
                                .ALUControl(ALUControl_Top),
                                .op(Instr[6:0]),
                                .funct3(Instr[14:12]),
                                .funct7(Instr[30]),
                                .zero(zero_Top)
                                

        );


        extend Sign_Extend(.In(Instr),
                        .ImmExt(ImmExt_Top),
                        .ImmSrc(ImmSrc_Top)
                        );

        mux MUX2(.a(RD1_Top),
                 .b(RD2_Top),
                 .s(ALUSrc_Top),
                 .c(SrcB)
                 ); 


        alu ALU(.A(RD1_Top),
                .B(SrcB),
                .Result(ALUResult_Top),
                .ALUControl(),
                .Z(zero_Top),
                );

        pc_adder PCTARGET(.a(PC_TOP),
                          .b(ImmExt_Top),
                          .c(PCTARGET_TOP)
                          );

        data_memory DM(.A(ALUResult_Top),
                       .WD(RD2_Top),
                       .clk(clk),
                       .WE(MemWrite_Top),
                       .RD(ReadData_Top)
                       );
        
        mux MUX3(.a(ALUResult_Top),
                 .b(ReadData_Top),
                 .s(ResultSrc_Top),
                 .c(Result)

        );


endmodule
