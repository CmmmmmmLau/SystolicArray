`timescale 1ns / 1ps


module tb_Calculation();
    reg clk, rst;
    
    reg [16*8-1:0]A, B;
    wire [19:0] reg_out_O;
    
    calculation uut(
        .clk(clk),
        .rst(rst),
        .A(A),
        .B(B),
        .reg_out_O(reg_out_O)
    );
    
    always #5 clk = ~clk;
    
    initial begin
        clk = 0; rst = 0;
        A = 128'hffffffffffffffffffffffffffffffff;
        B = 128'hffffffffffffffffffffffffffffffff;
        #100;
        rst = 1;
        #100
        rst = 0;

    end
endmodule
