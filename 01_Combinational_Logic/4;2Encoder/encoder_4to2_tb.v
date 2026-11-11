`timescale 1ns/1ps

module encoder_4to2_tb;

    reg  [3:0] D;
    wire [1:0] Y;

    encoder_4to2 uut (
        .D(D),
        .Y(Y)
    );

    initial begin

        $dumpfile("encoder_4to2.vcd");
        $dumpvars(0, encoder_4to2_tb);

        D = 4'b0001;
        #10;
        $display("D=%b Y=%b", D, Y);

        D = 4'b0010;
        #10;
        $display("D=%b Y=%b", D, Y);

        D = 4'b0100;
        #10;
        $display("D=%b Y=%b", D, Y);

        D = 4'b1000;
        #10;
        $display("D=%b Y=%b", D, Y);

        $finish;

    end

endmodule