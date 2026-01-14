module sseg (
    input logic enabled,
    input logic rst_n,
    input logic clk,
    input logic [3:0] digit3,
    input logic [3:0] digit2,
    input logic [3:0] digit1,
    input logic [3:0] digit0,
    output logic [3:0] sseg_an,
    output logic [6:0] sseg_ca
);

logic [3:0] mid_signal;
logic [3:0] digit_selected;

ring_counter u_ring_counter (
    .clk,
    .rst_n,
    .enabled,
    .value(mid_signal)
);

sseg_mux u_sseg_mux (
    .sel(mid_signal),
    .digit0,
    .digit1,
    .digit2,
    .digit3,
    .digit_selected
);

hex2sseg u_hex2sseg(
    .hex(digit_selected),
    .sseg(sseg_ca)
);

assign sseg_an = mid_signal;
endmodule