`timescale 1ns/1ps
module mux2to1_tb;
    reg [3:0] A;
    reg [3:0] B;
    reg S;
    wire [3:0] Y;

mux2to1 uut(
    .A(A),
    .B(B),
    .S(S),
    .Y(Y)
);

initial begin
    $dumpfile("waveforms.vcd");
    $dumpvars(0,mux2to1_tb);

    //TEST1
    A = 4'b0101;
    B = 4'b1111;
    S = 0;
    #10;

    //TEST2
    S=1;
    #10;

    //TEST3
    A = 4'b0011;
    B = 4'b1000;
    S=0;
    #10;

    //TEST4
    S=1;
    #10;
    $finish;
end
endmodule