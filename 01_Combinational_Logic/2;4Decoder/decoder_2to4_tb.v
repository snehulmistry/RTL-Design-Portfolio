module decoder_2to4_tb;

reg  [1:0] A;
wire [3:0] Y;

decoder_2to4 dut (
    .A(A),
    .Y(Y)
);

initial begin

    $dumpfile("decoder_2to4.vcd");
    $dumpvars(0, decoder_2to4_tb);

    A = 2'b00;
    #10;
    $display("A=%b Y=%b", A, Y);

    A = 2'b01;
    #10;
    $display("A=%b Y=%b", A, Y);

    A = 2'b10;
    #10;
    $display("A=%b Y=%b", A, Y);

    A = 2'b11;
    #10;
    $display("A=%b Y=%b", A, Y);

    $finish;

end

endmodule