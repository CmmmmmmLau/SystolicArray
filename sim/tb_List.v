`timescale 1ns / 1ps


module tb_List();
    reg clk;
    reg rst;
    
    always begin
        #5 clk = ~clk;
    end
    
    reg [7:0] comp1, comp2;
    reg [2:0] i,j;
    
    wire [16:0] data;
    
    reg [14:0] memory [16*16*8*8 - 1:0];
    initial $readmemb("C:/Users/qq512/Desktop/Sparse/binary_number.txt", memory);
    
    list uut(
        .clk(clk),
        .comp1(comp1),
        .comp2(comp2),
        .i(i),
        .j(j),
        .data(data)
    );
    
    initial begin
        clk = 0; rst = 0;
        comp1 = 0; comp2 = 0;
        i = 0; j = 0;
        
        #100;
        
        comp1 = 8'b11111001; comp2 = 8'b01101111;
        i = 3'b101; j = 3'b011;
    end

endmodule
