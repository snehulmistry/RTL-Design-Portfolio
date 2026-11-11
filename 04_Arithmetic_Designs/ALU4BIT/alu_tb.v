`timescale 1ns/1ps

module alu_tb;

    reg [3:0] A;
    reg [3:0] B;
    reg [2:0] OP;

    wire [3:0] RESULT;

    // Unit Under Test
    alu uut (
        .A(A),
        .B(B),
        .OP(OP),
        .RESULT(RESULT)
    );

    initial begin

        $dumpfile("waveform.vcd");
        $dumpvars(0, alu_tb);

        $display("Starting ALU Test...");

        // ADD
        A = 4'b0101;
        B = 4'b0011;
        OP = 3'b000;
        #10;

        // SUB
        OP = 3'b001;
        #10;

        // AND
        OP = 3'b010;
        #10;

        // OR
        OP = 3'b011;
        #10;

        // XOR
        OP = 3'b100;
        #10;

        // NOT
        OP = 3'b101;
        #10;

        $finish;

    end

endmodule