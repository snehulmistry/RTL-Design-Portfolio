module halfsub(
    input A,
    input B,
    output Diff,
    output Brw
);

assign Diff= A ^ B;
assign Brw = ~A & B;

endmodule