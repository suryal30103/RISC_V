module intsruction_memory(A,rst,RD):

    input [31:0] A;
    input rst;

    output [31:0] RD;
    
    //Creation of memory
    reg [31:0] Mem [1023:0];

    
    
    assign RD= (rst==1'b0) ? 32'h00000000 : Mem[A[31:2]]; //A represents the index of the reg in the memory //Active low reset block



endmodule