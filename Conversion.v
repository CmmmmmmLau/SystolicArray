module conversion(
    input clk,
    input rst,
    input [8*16-1:0] Vector,
    output [16*8-1:0] Matrix
);
    reg [16*8-1:0] Matrix_R;
    genvar i, j;
    
    // always @(*) begin
    //     for (i = 0; i < 16; i = i + 1) begin
    //         for (j = 0; j < 8; j = j + 1) begin
    //             Matrix_R[(7-j)*16 + i] = Vector[i*8 + j];
    //         end
    //     end
    // end

    for (i = 0; i < 16; i = i + 1) begin
        for (j = 0; j < 8; j = j + 1) begin
            assign Matrix[(7-j)*16 + i] = Vector[i*8 + j];
        end
    end

endmodule