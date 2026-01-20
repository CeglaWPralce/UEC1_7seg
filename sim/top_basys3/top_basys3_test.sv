module top_basys3_test;
/* Local variables and signals */  
logic clk, rst_n;
logic [3:0] digit0;
logic [3:0] digit1;
logic [3:0] digit2;
logic [3:0] digit3;
logic [3:0] sseg_an;
logic [6:0] sseg_ca;
top dut (
    .clk,
    .rst_n,
    .digit0,
    .digit1,
    .digit2,
    .digit3,
    .sseg_an,
    .sseg_ca
);

/* Tasks and functions definitions */
task reset;
    for (int i = 0; i < 2; ++i) begin
        @(negedge clk);
        rst_n = i[0];
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

    reset;
    digit0 = 4'b0000;
    digit1 = 4'b0001;
    digit2 = 4'b0010;
    digit3 = 4'b0011;


    for (int i = 0; i < 1000000; ++i) begin
        @(negedge clk);
        $display("Cycle %0d: digit3=%0d digit2=%0d digit1=%0d digit0=%0d | sseg_an=%b sseg_ca=%b", 
                 i, digit3, digit2, digit1, digit0, sseg_an, sseg_ca);
    end

    $finish;
end
endmodule