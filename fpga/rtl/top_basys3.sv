module top_basys3 (
    input wire clk,
    input wire btnC,
    input wire [15:0] sw,
    output wire [6:0] sseg_ca,
    output wire [3:0] sseg_an
);

top u_top(
    .clk(clk),
    .rst_n(!btnC),
    .digit0(sw[15:12]),
    .digit1(sw[11:8]),
    .digit2(sw[7:4]),
    .digit3(sw[3:0]),
    .sseg_ca(sseg_ca),
    .sseg_an(sseg_an)
);

endmodule
