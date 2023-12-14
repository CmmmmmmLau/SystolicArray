`timescale 1ns / 1ps
module tb_Conversion();
    reg clk;
    reg rst;
    
    initial begin
        clk = 0; rst = 0;
    end
    
    always begin
        #5 clk = ~clk;
    end
    
    reg [8*16-1:0] Vector;
    wire [16*8-1:0] Matrix;
    
    conversion uut (
        .clk(clk),
        .rst(rst),
        .Vector(Vector),
        .Matrix(Matrix)
    );
    initial begin
        Vector = 128'h01010101010101010101010101010101;
        #100 $finish;
    end
    
endmodule
