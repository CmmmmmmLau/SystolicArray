`timescale 1ns / 1ps

module tb_Sparse;

// parameters
parameter CLK_PERIOD = 10;

// reg declarations
reg clk;
reg rst;
reg [8*16-1:0] Vector_A;
reg [8*16-1:0] Vector_B;

// wire declarations
wire [24:0] out_Final;

// instance of the Sparse module
Sparse uut (
    .clk(clk),
    .Vector_A(Vector_A),
    .Vector_B(Vector_B),
    .rst(rst),
    .out_Final(out_Final)
);

// generate clock
always 
  # (CLK_PERIOD / 2) clk = ~clk;

// test stimulus
initial begin
  // initialize regs
  clk = 0;
  rst = 1;
  Vector_A = 128'hffffffffffffffffffffffffffffffff;
  Vector_B = 128'hffffffffffffffffffffffffffffffff;
  
  // apply reset
  #CLK_PERIOD rst = 0;

  // change inputs
//  #CLK_PERIOD Vector_A = 128'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF;
//  #CLK_PERIOD Vector_B = 128'h00000000000000000000000000000000;

  // more test vectors can be added here...
end

endmodule
