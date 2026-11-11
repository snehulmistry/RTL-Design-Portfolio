module Comparator_1bit(
    input A,
    input B,
    output G,
    output E,
    output L
);

assign G = A & ~B;
assign E = (~A & ~B) | (A & B);
assign L = ~A & B;

endmodule