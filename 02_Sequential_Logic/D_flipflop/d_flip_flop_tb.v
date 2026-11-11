`timescale 1ns/1ps

module d_flip_flop_tb;

    reg clk;
    reg d;

    wire q;

    reg expected_q;


    // Instantiate DUT
    d_flip_flop uut (
        .clk(clk),
        .d(d),
        .q(q)
    );


    // Clock generation
    always #5 clk = ~clk;


    // Generate waveform
    initial begin
        $dumpfile("waveform.vcd");
        $dumpvars(0, d_flip_flop_tb);
    end


    // Self-checking task
    task check_output;

        begin
            #1;

            if (q !== expected_q)
                $display("FAIL: Expected=%b | Actual=%b",
                         expected_q, q);
            else
                $display("PASS: Expected=%b | Actual=%b",
                         expected_q, q);
        end

    endtask


    // Test sequence
    initial begin

        clk = 0;
        d = 0;
        expected_q = 0;


        // Test 1
        d = 0;
        expected_q = 0;

        @(posedge clk);
        check_output;


        // Test 2
        d = 1;
        expected_q = 1;

        @(posedge clk);
        check_output;


        // Test 3
        d = 0;
        expected_q = 0;

        @(posedge clk);
        check_output;


        // Test 4
        d = 1;
        expected_q = 1;

        @(posedge clk);
        check_output;


        $display("--------------------------------");
        $display("D FLIP-FLOP TEST COMPLETE");
        $display("--------------------------------");

        $finish;

    end

endmodule