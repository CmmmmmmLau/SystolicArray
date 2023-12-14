`timescale 1ns / 1ps


module bitsAddTree2(
        input [11 * 8 - 1: 0] adder,
        output [15 : 0] result
    );

    wire [11 : 0] temp [5:0];

    assign temp[0] = adder[(11 * 1) - 1: (11 * 0)] + 
                     adder[(11 * 2) - 1: (11 * 1)];
    assign temp[1] = adder[(11 * 3) - 1: (11 * 2)] +
                     adder[(11 * 4) - 1: (11 * 3)];
    assign temp[2] = adder[(11 * 5) - 1: (11 * 4)] + 
                     adder[(11 * 6) - 1: (11 * 5)];
    assign temp[3] = adder[(11 * 7) - 1: (11 * 6)] +
                     adder[(11 * 7) - 1: (11 * 6)];

    assign temp[4] = temp[0] + temp[1];
    assign temp[5] = temp[2] + temp[3];

    assign result = temp[4] + temp[5];
endmodule
