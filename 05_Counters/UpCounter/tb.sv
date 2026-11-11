
`timescale 1ns/1ps

module tb;

    logic clk;
    logic rst;
    logic [3:0] count;

    // DUT Instantiation
    rtl DUT(
        .clk(clk),
        .rst(rst),
        .count(count)
    );

    // Clock Generation
    initial clk = 0;
    always #5 clk = ~clk;

    initial begin

        $dumpfile("wave.vcd");
        $dumpvars(0, tb);

        // Initial Conditions
        rst = 1;

        // Check Reset
        @(posedge clk);
        #1;

        if (count !== 4'b0000)
            $fatal(1, "Reset Failed");

        $display("Reset Passed");

        rst = 0;

        // Check all 16 states
        for (int i = 1; i < 16; i++) begin

            @(posedge clk);
            #1;

            if (count !== i[3:0])
                $fatal(1, "Count Failed at i=%0d, count=%0d", i, count);

        end

        $display("Counting Sequence Passed");

        // Check Rollover: 1111 -> 0000
        @(posedge clk);
        #1;

        if (count !== 4'b0000)
            $fatal(1, "Rollover Failed");

        $display("Rollover Passed");

        // All Tests Passed
        $display("---------------------------");
        $display("ALL TESTS PASSED");
        $display("---------------------------");

        $finish;

    end

endmodule
