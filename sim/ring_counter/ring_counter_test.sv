module ring_counter_test #(

    parameter int SIZE = 4
)();

    /* Local variables and signals */
    logic clk, rst_n;
    bit   enabled;
    logic [SIZE-1:0] value;

    ring_counter #(
        .SIZE(SIZE)
    ) dut (
        .clk,
        .rst_n,
        .enabled,
        .value
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
            $display("Cycle %0d: value = %b", i, value);
        end


    endtask

    task test_enabled_counter;
        enabled = 1'b1;

        reset;
        for (int i = 0; i < 10; ++i) begin
            @(negedge clk);
            $display("Cycle %0d: value = %b", i, value);
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