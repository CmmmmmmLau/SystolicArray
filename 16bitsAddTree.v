`timescale 1ns / 1ps


module bitsAddTree(
        input [12 * 8 - 1: 0] adder,
        output [19 : 0] result
    );

    wire [19 : 0] temp [5:0];

    assign temp[0] = adder[(8 * 1) - 1: (8 * 0)] + 
                     adder[(8 * 2) - 1: (8 * 1)];
    assign temp[1] = adder[(8 * 3) - 1: (8 * 2)] +
                     adder[(8 * 4) - 1: (8 * 3)];
    assign temp[2] = adder[(8 * 5) - 1: (8 * 4)] + 
                     adder[(8 * 6) - 1: (8 * 5)];
    assign temp[3] = adder[(8 * 7) - 1: (8 * 6)] +
                     adder[(8 * 7) - 1: (8 * 6)];

    assign temp[4] = temp[0] + temp[1];
    assign temp[5] = temp[2] + temp[3];

    assign result = temp[4] + temp[5];
endmodule
