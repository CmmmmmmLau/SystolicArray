`timescale 1ns / 1ps

module list (
    input clk,
    input [3:0] comp1,
    input [3:0] comp2,
    input [2:0] i,
    input [2:0] j,
    output reg [20:0] data
);

localparam MATRIX_SIZE = 256;
localparam BIT_NUMBERS = 4;
localparam MAX_SHIFTING = 7;

// wire [BIT_NUMBERS * 2 + 6 - 1:0] address;
// assign address = {comp1, comp2, i, j};

// reg [BIT_NUMBERS * 2 + 6 * 2:0] memory [(MATRIX_SIZE)-1:0];
// initial $readmemb("E:/Project/IDEA/SystolicArray/listv2.txt", memory);

// wire [14:0] data_reg;
// assign data_reg = memory[address];


wire [BIT_NUMBERS - 1:0] address;
assign address = comp1 & comp2;

wire [3:0] shifting;
assign shifting = i + j;

reg [20 :0] memory [(MATRIX_SIZE)-1:0];
initial $readmemb("E:/Project/IDEA/SystolicArray/listv1.txt", memory);


wire [(BIT_NUMBERS - 1) * 2:0] data_reg;
assign data_reg = memory[address];

always @(posedge clk) begin
    if (address < MATRIX_SIZE) begin
        data <= data_reg << shifting;
    end else begin
        data <= 9'b0;
    end
end

endmodule
