`timescale 1ns / 1ps

module list (
    input clk,
    input [3:0] comp1,
    input [3:0] comp2,
    input [2:0] i,
    input [2:0] j,
    output reg [16:0] data
);

localparam MATRIX_SIZE = 256;
localparam BIT_NUMBERS = 4;
localparam MAX_SHIFTING = 4;
localparam ROM_DATA = 3;

wire [(BIT_NUMBERS * 2) - 1 :0] address;
assign address = {comp1, comp2};

wire [MAX_SHIFTING - 1 :0] shifting;
assign shifting = i + j;

// reg [ROM_DATA - 1 :0] memory [(MATRIX_SIZE)-1:0];
// initial $readmemb("E:/Project/IDEA/SystolicArray/listv3.txt", memory);

// wire [ROM_DATA - 1 :0] data_reg;
// assign data_reg = memory[address];

wire [ROM_DATA - 1 :0] data_reg;
dist_mem_gen_0 list_ip (
    .a(address),
    .spo(data_reg)
);

// wire [ROM_DATA - 1 :0] data_reg;
// blk_mem_gen_0 list_ip (
//     .clka(clk),
//     .addra(address),
//     .douta(data_reg)
// );

always @(posedge clk) begin
    if (address < MATRIX_SIZE) begin
        data <= data_reg << shifting;
    end else begin
        data <= 17'b0;
    end
end

endmodule
