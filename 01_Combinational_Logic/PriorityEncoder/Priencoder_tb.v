`timescale 1ns/1ps

module Priencoder_tb;

reg  [3:0] D;
wire [1:0] Y;

Priencoder dut (
    .D(D),
    .Y(Y)
);

initial begin

    // Waveform dump
    $dumpfile("Priencoder.vcd");
    $dumpvars(0, Priencoder_tb);

    // Test cases
    D = 4'b0000; #10;
    D = 4'b0001; #10;
    D = 4'b0010; #10;
    D = 4'b0011; #10;
    D = 4'b0100; #10;
    D = 4'b0110; #10;
    D = 4'b0111; #10;
    D = 4'b1000; #10;
    D = 4'b1011; #10;
    D = 4'b1111; #10;

    $finish;

end

endmodule