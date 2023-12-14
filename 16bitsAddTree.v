`timescale 1ns / 1ps


module bitsAddTree(
        input [17 * 8 - 1: 0] adder,
        output [19 : 0] result
    );

    wire [19 : 0] temp [5:0];

    assign temp[0] = adder[(17 * 1) - 1: (17 * 0)] + 
                     adder[(17 * 2) - 1: (17 * 1)];
    assign temp[1] = adder[(17 * 3) - 1: (17 * 2)] +
                     adder[(17 * 4) - 1: (17 * 3)];
    assign temp[2] = adder[(17 * 5) - 1: (17 * 4)] + 
                     adder[(17 * 6) - 1: (17 * 5)];
    assign temp[3] = adder[(17 * 7) - 1: (17 * 6)] +
                     adder[(17 * 8) - 1: (17 * 7)];

    assign temp[4] = temp[0] + temp[1];
    assign temp[5] = temp[2] + temp[3];

    assign result = temp[4] + temp[5];
endmodule
