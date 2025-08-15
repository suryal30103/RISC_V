module reg_file(A1,A2,A3,WD3,WE3,RD1,RD2,clk,rst);

    input [4:0] A1,A2,A3;
    input [31:0] WD3;
    input clk,rst,WE3;

    output [31:0] RD1,RD2;

    //creating 32 registers of size 32 bits
    reg [31:0] register [31:0];

    //read functionality
    assign RD1= (rst==1'b0) ? 32'h00000000:register[A1];
    assign RD2= (rst==1'b0) ? 32'h00000000:register[A2];

    //write functionality
    always@(posedge clk)
    begin

        if (WE3)
        begin
            register[A3]<=WD3;
        end



    end


endmodule