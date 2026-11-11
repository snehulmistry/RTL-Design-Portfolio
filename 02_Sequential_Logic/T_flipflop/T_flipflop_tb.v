`timescale 1ns/1ps

module T_flipflop_tb;

    reg clk;
    reg t;
    reg expected_q;
    wire q;

    T_flipflop uut(
        .clk(clk),
        .t(t),
        .q(q)
    );

    // Clock generation
    always #5 clk = ~clk;

    // Waveform dumping
    initial begin
        $dumpfile("waveform.vcd");
        $dumpvars(0, T_flipflop_tb);
    end

    // Self-checking task
    task check_output;
        begin
            #1;

            if(q !== expected_q)
                $display("FAIL: Expected=%b | Actual=%b",
                         expected_q, q);
            else
                $display("PASS: Expected=%b | Actual=%b",
                         expected_q, q);
        end
    endtask

    // Test Sequence
    initial begin

        clk = 0;
        t = 0;
        expected_q = 0;

        // Test 1: Hold
        t = 0;
        expected_q = 0;

        @(posedge clk);
        check_output;

        // Test 2: Toggle
        t = 1;
        expected_q = 1;

        @(posedge clk);
        check_output;

        $display("--------------------------------------");
        $display("T FLIP-FLOP TEST COMPLETE");
        $display("--------------------------------------");

        $finish;

    end

endmodule