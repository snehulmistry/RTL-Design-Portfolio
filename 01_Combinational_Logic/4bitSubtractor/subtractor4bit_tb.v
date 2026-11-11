`timescale 1ns/1ps

module subtractor4bit_tb;

    reg [3:0] A;
    reg [3:0] B;
    reg Bin;

    wire [3:0] Diff;
    wire Bout;

    subtractor4bit uut (
        .A(A),
        .B(B),
        .Bin(Bin),
        .Diff(Diff),
        .Bout(Bout)
    );

    initial begin

        $dumpfile("waveform.vcd");
        $dumpvars(0, subtractor4bit_tb);

        // Test Case 1: 0 - 0 = 0
        A = 4'b0000;
        B = 4'b0000;
        Bin = 1'b0;
        #20;

        // Test Case 2: 5 - 3 = 2
        A = 4'b0101;
        B = 4'b0011;
        Bin = 1'b0;
        #20;

        // Test Case 3: 10 - 5 = 5
        A = 4'b1010;
        B = 4'b0101;
        Bin = 1'b0;
        #20;

        // Test Case 4: 3 - 5 requires borrow
        A = 4'b0011;
        B = 4'b0101;
        Bin = 1'b0;
        #20;

        // Test Case 5: 15 - 1 = 14
        A = 4'b1111;
        B = 4'b0001;
        Bin = 1'b0;
        #20;

        // Test Case 6: 5 - 3 - 1 = 1
        A = 4'b0101;
        B = 4'b0011;
        Bin = 1'b1;
        #20;

        $finish;

    end

endmodule