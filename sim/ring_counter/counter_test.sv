module counter_test;

/* Local variables and signals */
logic clk, rst_n;
logic enabled;
logic overflow;

counter dut (
    .clk,
    .rst_n,
    .enabled,
    .overflow
);


/* Tasks and functions definitions */

task reset;
    for (int i = 0; i < 2; ++i) begin
        @(negedge clk);
        rst_n = i[0];
    end
endtask

task test_disabled_counter;
    enabled = 1'b0;

    reset;
    for (int i = 0; i < 10; ++i) begin
        @(negedge clk);
        $display("Cycle %0d: overflow = %b", i, overflow);
    end
endtask

task test_enabled_counter;
    enabled = 1'b1;

    reset;
    for (int i = 0; i < 10; ++i) begin
        @(negedge clk);
        $display("Cycle %0d: overflow = %b", i, overflow);
    end
endtask

/* Clock generation */
initial begin
    clk = 1'b0;
    forever #5 clk = ~clk;
end

/* Test */
initial begin
    rst_n   = 1'b1;
    enabled = 1'b0;

    test_disabled_counter;
    test_enabled_counter;

    $finish;
end

endmodule