module halfsub_tb;

    reg A;
    reg B;
    wire Diff;
    wire Brw;

    integer i;

    halfsub uut (
        .A(A),
        .B(B),
        .Diff(Diff),
        .Brw(Brw)
    );

    initial begin

        $dumpfile("waveform.vcd");
        $dumpvars(0, halfsub_tb);

        // Testing all possible input combinations
        for (i = 0; i < 4; i = i + 1) begin
            {A, B} = i;
            #10;
        end

        $finish;

    end

endmodule