module alu(A,B,ALUControl,Result,Z,N,V,C);
        //declaring inputs
        input [31:0] A,B; //32 bits input
        input [2:0] ALUControl; //3 bits Control signal for ALUControl

        //Declaring outputs
        output [31:0]Result;

        //Declaring flags
        output Z,N,V,C;
        

        //Declaring internal wires
        wire [31:0] a_and_b;
        wire [31:0] a_or_b;
        wire [31:0] not_b;
        wire [31:0] mux_1;
        wire [31:0] sum;
        wire[31:0] mux_2;
        wire [31:0] slt;
       
        

        //Logic Design
        assign a_and_b=A&B;

        assign a_or_b=A|B;

        assign not_b=~B;

        //Ternary operation
        //output=(condition)?first_value:second_valu
        assign mux_1=(ALUControl[0]==1'b0)?B:not_b;

        assign {cout,sum}=A+mux_1+ALUControl[0];

         //Zero flag
        assign Z=&(~Result);

        //negative flag
        assign N=Result[31];

        //carry flag
        assign C=cout&(~ALUControl[1]);

        //Overflow Flag
        assign V=(~ALUControl[1])&(A[31]^sum[31])&(~(A[31]^B[31]^ALUcontrol[0]));

        //zero extension
        assign slt= {31'b0000000000000000000000000000000,sum[31]};



        //Final putput using 4:1 MUX 
        assign mux_2=(ALUControl[2:0]==3'b000)?sum:
                     (ALUControl[2:0]==3'b001)?sum:
                     (ALUControl[2:0]==3'b010)?a_and_b:
                     (ALUControl[2:0]==3'b011)?a_or_b;
                     (ALUControl[2:0]==3'b101)?slt:32'h00000000;

        assign Result=mux_2;
       










endmodule