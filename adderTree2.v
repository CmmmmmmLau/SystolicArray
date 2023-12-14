`timescale 1ns / 1ps


module bitsAddTree2(
        input [20 * 8 - 1: 0] adder,
        output [22 : 0] result
    );

    wire [20 : 0] temp [5:0];

    assign temp[0] = adder[(20 * 1) - 1: (20 * 0)] + 
                     adder[(20 * 2) - 1: (20 * 1)];
    assign temp[1] = adder[(20 * 3) - 1: (20 * 2)] +
                     adder[(20 * 4) - 1: (20 * 3)];
    assign temp[2] = adder[(20 * 5) - 1: (20 * 4)] + 
                     adder[(20 * 6) - 1: (20 * 5)];
    assign temp[3] = adder[(20 * 7) - 1: (20 * 6)] +
                     adder[(20 * 8) - 1: (20 * 7)];

    assign temp[4] = temp[0] + temp[1];
    assign temp[5] = temp[2] + temp[3];

    assign result = temp[4] + temp[5];
endmodule
