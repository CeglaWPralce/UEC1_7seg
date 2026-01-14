module top (
    input logic clk,
    input logic rst_n,
    input logic digit0,
    input logic digit1,
    input logic digit2,
    input logic digit3
);

sseg u_sseg(
    .enabled (overflow),
    .rst_n,
    .clk,
    .digit3,
    .digit2,
    .digit1,
    .digit0,
    .sseg_an,
    .sseg_ca
);

counter u_counter(
    .clk,
    .rst_n,
    .enabled (overflow),
    .overflow
);

endmodule
