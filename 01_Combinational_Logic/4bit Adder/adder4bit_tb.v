`timescale 1ns/1ps

module adder4bit_tb;

    reg  [3:0] A;
    reg  [3:0] B;
    reg        Cin;

    wire [3:0] Sum;
    wire       Cout;

    // DUT
    adder4bit uut (
        .A(A),
        .B(B),
        .Cin(Cin),
        .Sum(Sum),
        .Cout(Cout)
    );

    initial begin

        $dumpfile("Adder4bit.vcd");
        $dumpvars(0,adder4bit_tb);

        $monitor("Time=%0t | A=%b B=%b Cin=%b | Sum=%b Cout=%b",
                 $time, A, B, Cin, Sum, Cout);

        // Test Case 1: 0 + 0 = 0
        A = 4'b0000;
        B = 4'b0000;
        Cin = 1'b0;
        #20;

        // Test Case 2: 1 + 1 = 2
        A = 4'b0001;
        B = 4'b0001;
        Cin = 1'b0;
        #20;

        // Test Case 3: 5 + 3 = 8
        A = 4'b0101;
        B = 4'b0011;
        Cin = 1'b0;
        #20;

        // Test Case 4: 15 + 1 = 16
        A = 4'b1111;
        B = 4'b0001;
        Cin = 1'b0;
        #20;

        // Test Case 5: 15 + 15 = 30
        A = 4'b1111;
        B = 4'b1111;
        Cin = 1'b0;
        #20;

        // Test Case 6: Addition with Carry-In
        // 5 + 5 + 1 = 11
        A = 4'b0101;
        B = 4'b0101;
        Cin = 1'b1;
        #20;

        $finish;

    end

endmodule