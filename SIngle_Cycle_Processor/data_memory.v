module data_memory(A,WD,clk,WE,RD);

    input [31:0] A,WD;
    input clk,WE;

    output [31:0] RD;

    //creating memory
    reg [31:0] data_mem[1023:0];

    //read functionality
    assign RD=(WE==1'b0) ? data_mem[A]:32'h00000000;    

    always@(posedge clk) begin

        if(WE)
        data_mem[A]<=WD;

    
    end



endmodule
