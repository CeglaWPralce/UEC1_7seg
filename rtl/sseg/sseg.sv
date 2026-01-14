module sseg (
    input logic enabled,
    input logic rst_n,
    input logic clk,
    input logic digit3,
    input logic digit2,
    input logic digit1,
    input logic digit0,
    output logic sseg_an,
    output logic sseg_ca
);

ring_counter u_ring_counter (
    .clk,
    .rst_n,
    .enabled,
    .value
);

sseg_mux u_sseg_mux (
    .sel(value),
    .digit0,
    .digit1,
    .digit2,
    .digit3,
    .digit_selected
);

hex2sseg u_hex2sseg(
    .hex(digit_selected),
    .sseg
);

endmodule