
module tb;

logic clk;
logic rst;
logic [3:0] count;

// Expected states
logic [3:0] expected [0:7];

// DUT
rtl DUT(
    .clk(clk),
    .rst(rst),
    .count(count)
);

// Clock Generation
initial clk = 0;
always #5 clk = ~clk;

// VCD Dumping
initial begin
    $dumpfile("wave.vcd");
    $dumpvars(0, tb);
end

// Main Testbench
initial begin

    // Expected Johnson Sequence
    expected[0] = 4'b0001;
    expected[1] = 4'b0011;
    expected[2] = 4'b0111;
    expected[3] = 4'b1111;
    expected[4] = 4'b1110;
    expected[5] = 4'b1100;
    expected[6] = 4'b1000;
    expected[7] = 4'b0000;

    // Initial Conditions
    rst = 1;

    // Reset Check
    @(posedge clk);
    #1;

    if(count !== 4'b0000)
        $fatal(1, "Reset Failed");
    else
        $display("Reset Passed");

    rst = 0;

    // Johnson Sequence Checks
    for(int i = 0; i < 8; i++) begin

        @(posedge clk);
        #1;

        if(count !== expected[i])
            $fatal(1,
                "Sequence Failed at state %0d. Expected %b, Got %b",
                i+1, expected[i], count);

        $display("State %0d Passed: %b", i+1, count);

    end

    $display("Johnson Sequence Passed");
    $display("Rollover Passed");

    // Reset During Operation
    rst = 1;

    @(posedge clk);
    #1;

    if(count !== 4'b0000)
        $fatal(1, "Mid-Operation Reset Failed");
    else
        $display("Mid-Operation Reset Passed");

    // Final Results
    $display("---------------------------");
    $display("ALL TESTS PASSED");
    $display("---------------------------");

    $finish;

end

endmodule
