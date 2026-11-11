module register_4bit_tb;

reg clk;
reg [3:0] d;
wire [3:0] q;

register_4bit uut(
    .clk(clk),
    .d(d),
    .q(q)
);

// Clock Generation
always #5 clk = ~clk;

// Waveform Dumping
initial begin
    $dumpfile("waveform.vcd");
    $dumpvars(0, register_4bit_tb);
end

// Self Checking Testbench
task check_output;
    input [3:0] expected_q;

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

// Testing
initial begin
    #1;
    clk = 0;
    d = 4'b0000;

    // Test 1
    d = 4'b1010;
    #10;
    check_output(4'b1010);

    // Test 2
    d = 4'b1010;
    #10;
    check_output(4'b1010);

    // Test 3
    d = 4'b1111;
    #10;
    check_output(4'b1111);

    // Test 4
    d = 4'b0000;
    #10;
    check_output(4'b0000);

    $finish;
end

endmodule