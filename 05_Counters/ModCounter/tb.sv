
module tb;

logic clk;
logic rst;
logic [3:0] count;

integer errors = 0;

// DUT
rtl #(
    .N(10),
    .WIDTH(4)
) DUT (
    .clk(clk),
    .rst(rst),
    .count(count)
);

// Clock Generation
initial clk = 0;
always #5 clk = ~clk;

// Waveform Dumping
initial begin
    $dumpfile("wave.vcd");
    $dumpvars(0, tb);
end

// Test Sequence
initial begin

    // Initial Conditions
    rst = 1;

    // Reset Test
    @(posedge clk);
    #1;

    if (count === 0)
        $display("Reset Passed");
    else begin
        $display("Reset Failed");
        errors++;
    end

    @(negedge clk);
    rst = 0;

    // Counting and Rollover Test
    for (int i = 0; i < 20; i++) begin

        @(posedge clk);
        #1;

        if (count !== ((i+1) % 10)) begin
            $display("Counting Failed at iteration %0d", i);
            errors++;
        end
        else begin
            $display("Iteration %0d Passed | Count = %0d", i, count);
        end

    end

    // Final Test Summary
    $display("---------------------------");

    if (errors == 0)
        $display("ALL TESTS PASSED");
    else
        $display("TESTS FAILED | Errors = %0d", errors);

    $display("---------------------------");

    $finish;

end

endmodule
