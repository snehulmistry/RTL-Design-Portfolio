
module tb;

logic clk;
logic rst;
logic [3:0] count;

// DUT
rtl DUT(
    .clk(clk),
    .rst(rst),
    .count(count)
);

// Clock Generation
initial clk = 0;
always #5 clk = ~clk;

// Dumping
initial begin
    $dumpfile("wave.vcd");
    $dumpvars(0, tb);
end

initial begin

    // Initial Conditions
    rst = 1;

    // Reset Check
    @(posedge clk);
    #1;
    if(count !== 4'b0001)
        $fatal(1, "Reset Failed");
    else
        $display("Reset Passed");

    rst = 0;

    // Ring Sequence Checks
    @(posedge clk); #1;
    if(count !== 4'b0010)
        $fatal(1, "State 0010 Failed");

    @(posedge clk); #1;
    if(count !== 4'b0100)
        $fatal(1, "State 0100 Failed");

    @(posedge clk); #1;
    if(count !== 4'b1000)
        $fatal(1, "State 1000 Failed");

    @(posedge clk); #1;
    if(count !== 4'b0001)
        $fatal(1, "Rollover Failed");

    $display("Ring Sequence Passed");

    // Reset during Operation
    rst = 1;
    @(posedge clk); #1;

    if(count !== 4'b0001)
        $fatal(1, "Mid-Operation Reset Failed");

    $display("Mid-Operation Reset Passed");

    $display("--------------------");
    $display("ALL TESTS PASSED");
    $display("--------------------");

    $finish;
end

endmodule
