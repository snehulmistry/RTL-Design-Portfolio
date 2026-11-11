`timescale 1ns/1ps

module jk_flipflop_tb;

reg j;
reg k;
reg clk;
wire q;
reg expected_q;

jk_flipflop uut(
    .clk(clk),
    .j(j),
    .k(k),
    .q(q)
);

// Clock generation
always #5 clk = ~clk;

// Generate waveform
initial begin
    $dumpfile("waveform.vcd");
    $dumpvars(0, jk_flipflop_tb);
end

// Self Checking Task
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


   // Test Sequence
initial begin

    clk = 0;
    j = 0;
    k = 0;
    expected_q = 0;

    // Test 1: Set
    j = 1;
    k = 0;
    expected_q = 1;

    @(posedge clk);
    check_output;

    // Test 2: Hold
    j = 0;
    k = 0;
    expected_q = 1;

    @(posedge clk);
    check_output;

    // Test 3: Reset
    j = 0;
    k = 1;
    expected_q = 0;

    @(posedge clk);
    check_output;

    // Test 4: Set
    j = 1;
    k = 0;
    expected_q = 1;

    @(posedge clk);
    check_output;

    // Test 5: Toggle
    j = 1;
    k = 1;
    expected_q = 0;

    @(posedge clk);
    check_output;

    $display("--------------------------------------");
    $display("JK FLIP-FLOP TEST COMPLETE");
    $display("--------------------------------------");

    $finish;

end
endmodule