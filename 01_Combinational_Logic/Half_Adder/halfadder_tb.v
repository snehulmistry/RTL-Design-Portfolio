module halfadder_tb;
reg A;
reg B;
wire Sum;
wire Carry;

halfadder uut(
    .A(A),
    .B(B),
    .Sum(Sum),
    .Carry(Carry)
);

initial begin
    $dumpfile("Halfadder.vcd");
    $dumpvars(0,halfadder_tb);

    //Testing
    A=1'b0; B=1'b0; #10;
    A=1'b0; B=1'b1;  #10;
    A=1'b1; B=1'b0; #10;
    A=1'b1; B=1'b1; #10;
    $finish;
end
endmodule
