module Sparse(
    input clk,
    input [8*16-1:0] Vector_A ,
    input [8*16-1:0] Vector_B,
    input rst,
    output reg [19:0] out_Final
    );
    
wire [16*8-1:0] Matrix_A;
wire [16*8-1:0] Matrix_B;
wire out_R = 0;
wire [19:0] out_R_temp;

conversion conv1(
	 .clk(clk),
	 .rst(rst),
    .Vector(Vector_A),
    .Matrix(Matrix_A)
);

conversion conv2(
    .clk(clk),
	 .rst(rst),
    .Vector(Vector_B),
    .Matrix(Matrix_B)
);

calculation cal (
    .clk(clk),
	 .rst(rst),
    .A(Matrix_A),
    .B(Matrix_B),
    .reg_out_O(out_R_temp)
);

always @(posedge clk) begin
    if (rst) begin 
        //reset logic here
        out_Final <=0;
    end
    else begin 
            
    end
end

// assign out_R = out_R_temp;
//assign out_Final = out_R;

endmodule