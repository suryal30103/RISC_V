module p_c(PC_NEXT,PC,rst,clk);

    input [31:0] PC_NEXT;
    input rst,clk;


    output reg [31:0] PC;

    always@(posedge clk)
    begin

    if (rst==0) //active low reset 
        PC<=32'h00000000;
     

    else
        PC<=PC_NEXT;
    end

    



 

endmodule