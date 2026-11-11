module T_flipflop (
    input clk,
    input t,
    output reg q
);

initial begin
    q = 1'b0;
end

always @(posedge clk) begin
    case (t)
        1'b0: q <= q;    // Hold
        1'b1: q <= ~q;   // Toggle
    endcase
end

endmodule