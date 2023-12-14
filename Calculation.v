module calculation (
    input clk,
    input rst,
    input [16*8-1:0] A,
    input [16*8-1:0] B,
    output [19:0] reg_out_O
);

    reg [3:0] comp1 [8 * 8 * 4 - 1:0];
    reg [3:0] comp2 [8 * 8 * 4 - 1:0];
    wire [12:0] result [8 * 8 * 4 - 1:0];
    wire [11:0] sum [31:0];
    wire [15:0] sum_b [3:0];
    integer i, j;
    reg [19:0] reg_out;
    
    generate
        genvar k, l, n;
        for (n = 0; n < 4 ; n = n + 1) begin: adder_tree_sum
            for (l = 0; l < 8; l = l + 1) begin: list_sum
                for (k = 0; k < 8; k = k + 1) begin: list_instances
                    list list (
                        .clk(clk),
                        .comp1(comp1[64 * n + 8 * l + k]),
                        .comp2(comp2[64 * n + 8 * l + k]),
                        .i(7 - l),
                        .j(7 - k),
                        .data(result[64 * n + 8 * l + k])
                    );
                end
                bitsAddTree listSum(
                    .adder({
                        result[64 * n + l * 8    ],
                        result[64 * n + l * 8 + 1],
                        result[64 * n + l * 8 + 2],
                        result[64 * n + l * 8 + 3],
                        result[64 * n + l * 8 + 4],
                        result[64 * n + l * 8 + 5],
                        result[64 * n + l * 8 + 6],
                        result[64 * n + l * 8 + 7]
                    }),
                    .result(sum[8 * n + l])
                );
            end
            bitsAddTree2 Sum(
                .adder({
                    sum[8 * n    ],
                    sum[8 * n + 1],
                    sum[8 * n + 2],
                    sum[8 * n + 3],
                    sum[8 * n + 4],
                    sum[8 * n + 5],
                    sum[8 * n + 6],
                    sum[8 * n + 7]
                }),
                .result(sum_b[n])
            );
        end
    endgenerate

    always @(posedge clk) begin
        if (!rst) begin
            for (i = 0; i < 8; i = i + 1) begin
                comp1[64 * 0 + 8 * i    ] <= {A[16 * i +  3], A[16 * i +  2], A[16 * i + 1], A[16 * i      ]}; comp2[64 * 0 + 8 * i    ] <= B[  3:   0];
                comp1[64 * 0 + 8 * i + 1] <= {A[16 * i +  3], A[16 * i +  2], A[16 * i + 1], A[16 * i      ]}; comp2[64 * 0 + 8 * i + 1] <= B[ 19:  16];
                comp1[64 * 0 + 8 * i + 2] <= {A[16 * i +  3], A[16 * i +  2], A[16 * i + 1], A[16 * i      ]}; comp2[64 * 0 + 8 * i + 2] <= B[ 35:  32];
                comp1[64 * 0 + 8 * i + 3] <= {A[16 * i +  3], A[16 * i +  2], A[16 * i + 1], A[16 * i      ]}; comp2[64 * 0 + 8 * i + 3] <= B[ 51:  48];
                comp1[64 * 0 + 8 * i + 4] <= {A[16 * i +  3], A[16 * i +  2], A[16 * i + 1], A[16 * i      ]}; comp2[64 * 0 + 8 * i + 4] <= B[ 67:  64];
                comp1[64 * 0 + 8 * i + 5] <= {A[16 * i +  3], A[16 * i +  2], A[16 * i + 1], A[16 * i      ]}; comp2[64 * 0 + 8 * i + 5] <= B[ 83:  80];
                comp1[64 * 0 + 8 * i + 6] <= {A[16 * i +  3], A[16 * i +  2], A[16 * i + 1], A[16 * i      ]}; comp2[64 * 0 + 8 * i + 6] <= B[ 99:  96];
                comp1[64 * 0 + 8 * i + 7] <= {A[16 * i +  3], A[16 * i +  2], A[16 * i + 1], A[16 * i      ]}; comp2[64 * 0 + 8 * i + 7] <= B[115: 112];
  
                comp1[64 * 1 + 8 * i    ] <= {A[16 * i +  7], A[16 * i +  6], A[16 * i + 5], A[16 * i +   4]}; comp2[64 * 1 + 8 * i    ] <= B[  7:   4];
                comp1[64 * 1 + 8 * i + 1] <= {A[16 * i +  7], A[16 * i +  6], A[16 * i + 5], A[16 * i +   4]}; comp2[64 * 1 + 8 * i + 1] <= B[ 23:  20];
                comp1[64 * 1 + 8 * i + 2] <= {A[16 * i +  7], A[16 * i +  6], A[16 * i + 5], A[16 * i +   4]}; comp2[64 * 1 + 8 * i + 2] <= B[ 39:  36];
                comp1[64 * 1 + 8 * i + 3] <= {A[16 * i +  7], A[16 * i +  6], A[16 * i + 5], A[16 * i +   4]}; comp2[64 * 1 + 8 * i + 3] <= B[ 55:  52];
                comp1[64 * 1 + 8 * i + 4] <= {A[16 * i +  7], A[16 * i +  6], A[16 * i + 5], A[16 * i +   4]}; comp2[64 * 1 + 8 * i + 4] <= B[ 71:  68];
                comp1[64 * 1 + 8 * i + 5] <= {A[16 * i +  7], A[16 * i +  6], A[16 * i + 5], A[16 * i +   4]}; comp2[64 * 1 + 8 * i + 5] <= B[ 87:  84];
                comp1[64 * 1 + 8 * i + 6] <= {A[16 * i +  7], A[16 * i +  6], A[16 * i + 5], A[16 * i +   4]}; comp2[64 * 1 + 8 * i + 6] <= B[103: 100];
                comp1[64 * 1 + 8 * i + 7] <= {A[16 * i +  7], A[16 * i +  6], A[16 * i + 5], A[16 * i +   4]}; comp2[64 * 1 + 8 * i + 7] <= B[119: 116]; 

                comp1[64 * 2 + 8 * i    ] <= {A[16 * i + 11], A[16 * i + 10], A[16 * i + 9], A[16 * i +   8]}; comp2[64 * 2 + 8 * i    ] <= B[ 11:   8];
                comp1[64 * 2 + 8 * i + 1] <= {A[16 * i + 11], A[16 * i + 10], A[16 * i + 9], A[16 * i +   8]}; comp2[64 * 2 + 8 * i + 1] <= B[ 27:  24];
                comp1[64 * 2 + 8 * i + 2] <= {A[16 * i + 11], A[16 * i + 10], A[16 * i + 9], A[16 * i +   8]}; comp2[64 * 2 + 8 * i + 2] <= B[ 43:  40];
                comp1[64 * 2 + 8 * i + 3] <= {A[16 * i + 11], A[16 * i + 10], A[16 * i + 9], A[16 * i +   8]}; comp2[64 * 2 + 8 * i + 3] <= B[ 59:  56];
                comp1[64 * 2 + 8 * i + 4] <= {A[16 * i + 11], A[16 * i + 10], A[16 * i + 9], A[16 * i +   8]}; comp2[64 * 2 + 8 * i + 4] <= B[ 75:  72];
                comp1[64 * 2 + 8 * i + 5] <= {A[16 * i + 11], A[16 * i + 10], A[16 * i + 9], A[16 * i +   8]}; comp2[64 * 2 + 8 * i + 5] <= B[ 91:  88];
                comp1[64 * 2 + 8 * i + 6] <= {A[16 * i + 11], A[16 * i + 10], A[16 * i + 9], A[16 * i +   8]}; comp2[64 * 2 + 8 * i + 6] <= B[107: 104];
                comp1[64 * 2 + 8 * i + 7] <= {A[16 * i + 11], A[16 * i + 10], A[16 * i + 9], A[16 * i +   8]}; comp2[64 * 2 + 8 * i + 7] <= B[123: 120];

                comp1[64 * 3 + 8 * i    ] <= {A[16 * i + 15], A[16 * i + 14], A[16 * i + 13], A[16 * i + 12]}; comp2[64 * 3 + 8 * i    ] <= B[ 15:  12];
                comp1[64 * 3 + 8 * i + 1] <= {A[16 * i + 15], A[16 * i + 14], A[16 * i + 13], A[16 * i + 12]}; comp2[64 * 3 + 8 * i + 1] <= B[ 31:  28];
                comp1[64 * 3 + 8 * i + 2] <= {A[16 * i + 15], A[16 * i + 14], A[16 * i + 13], A[16 * i + 12]}; comp2[64 * 3 + 8 * i + 2] <= B[ 47:  44];
                comp1[64 * 3 + 8 * i + 3] <= {A[16 * i + 15], A[16 * i + 14], A[16 * i + 13], A[16 * i + 12]}; comp2[64 * 3 + 8 * i + 3] <= B[ 63:  60];
                comp1[64 * 3 + 8 * i + 4] <= {A[16 * i + 15], A[16 * i + 14], A[16 * i + 13], A[16 * i + 12]}; comp2[64 * 3 + 8 * i + 4] <= B[ 79:  76];
                comp1[64 * 3 + 8 * i + 5] <= {A[16 * i + 15], A[16 * i + 14], A[16 * i + 13], A[16 * i + 12]}; comp2[64 * 3 + 8 * i + 5] <= B[ 95:  92];
                comp1[64 * 3 + 8 * i + 6] <= {A[16 * i + 15], A[16 * i + 14], A[16 * i + 13], A[16 * i + 12]}; comp2[64 * 3 + 8 * i + 6] <= B[111: 108];
                comp1[64 * 3 + 8 * i + 7] <= {A[16 * i + 15], A[16 * i + 14], A[16 * i + 13], A[16 * i + 12]}; comp2[64 * 3 + 8 * i + 7] <= B[127: 124];
            end
        end else begin
            reg_out <= 20'b0;
        end
    end
    assign reg_out_O = (sum_b[0] + sum_b[1]) + (sum_b[2] + sum_b[3]);

    // genvar s;
    // generate
    //     for (s = 0; s < 8 * 8 * 4; s = s + 1) begin
    //         assign reg_out_O = reg_out_O + result[s];
    //     end
    // endgenerate


endmodule