module subtractor4bit (
    input [3:0] A,
    input [3:0] B,
    input Bin,
    output [3:0] Diff,
    output Bout
);

    assign Diff = A - B - Bin;
    assign Bout = (A < B + Bin);

endmodule