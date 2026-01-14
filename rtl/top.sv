module top (
    input logic clk,
    input logic rst_n,
    input logic [3:0] digit0,
    input logic [3:0] digit1,
    input logic [3:0] digit2,
    input logic [3:0] digit3,
    output logic [3:0] sseg_an,
    output logic [6:0] sseg_ca
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
