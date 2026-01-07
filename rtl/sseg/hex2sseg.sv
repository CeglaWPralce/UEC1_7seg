module hex2sseg (
    input logic [3:0] hex,
    output logic [6:0] sseg
);

// bits for segments  gfedcba
localparam logic [6:0] CODES [0:15] = '{
    7'b1000000, // 0
    7'b1111001, // 1
    7'b0100100, // 2
    7'b0110000, // 3
    7'b0011001, // 4
    7'b0010010, // 5
    7'b0000010, // 6
    7'b1111000, // 7
    7'b0000000, // 8
    7'b0000000, // 9
    7'b0000000, // A  TODO
    7'b0000000, // B  TODO
    7'b0000000, // C  TODO
    7'b0000000, // D  TODO
    7'b0000000, // E  TODO
    7'b0000000  // F  TODO
};

assign sseg = CODES[hex];

endmodule
