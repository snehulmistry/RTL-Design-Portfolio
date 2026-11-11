module Comparator_1bit_tb;

    reg A;
    reg B;
    wire G;
    wire E;
    wire L;

    Comparator_1bit uut(
        .A(A),
        .B(B),
        .G(G),
        .E(E),
        .L(L)
    );

    initial begin

        $dumpfile("Comparator_1bit.vcd");
        $dumpvars(0, Comparator_1bit_tb);

        // Testing
        A = 1'b0; B = 1'b0; #10;
        A = 1'b0; B = 1'b1; #10;
        A = 1'b1; B = 1'b0; #10;
        A = 1'b1; B = 1'b1; #10;

        $finish;

    end

endmodule