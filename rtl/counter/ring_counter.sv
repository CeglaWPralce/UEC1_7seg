module ring_counter #(
    parameter int SIZE = 4
)(
    input  logic clk,
    input  logic rst_n,
    input  bit   enabled,
    output logic [SIZE-1:0] value
);

logic [SIZE-1:0] value_nxt;
int i;

/* Sequential logic */
always_ff @(posedge clk or negedge rst_n) begin
    if (!rst_n)
        value <= {1'b0, {SIZE-1{1'b1}}}; // pierwszy bit 0, reszta 1
    else
        value <= value_nxt;
end

/* Combinational logic */
always_comb begin
    value_nxt = value;

    if (enabled) begin
        // wyczyść wszystko na 1
        value_nxt = {SIZE{1'b1}};

        // znajdź aktualny 0 i ustaw kolejny bit jako 0
        for (i = 0; i < SIZE; i++) begin
            if (value[i] == 1'b0) begin
                if (i == SIZE-1)
                    value_nxt[0] = 1'b0;
                else
                    value_nxt[i+1] = 1'b0;
            end
        end
    end
end

endmodule
