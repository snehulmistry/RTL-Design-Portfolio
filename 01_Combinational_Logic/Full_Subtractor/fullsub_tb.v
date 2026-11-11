module fullsub_tb;

    reg A;
    reg B;
    reg Bin;

    wire Diff;
    wire Bout;

    integer i;

    fullsub uut (
        .A(A),
        .B(B),
        .Bin(Bin),
        .Diff(Diff),
        .Bout(Bout)
    );

    initial begin

        $dumpfile("waveform.vcd");
        $dumpvars(0, fullsub_tb);

        // Test all 8 possible input combinations
        for (i = 0; i < 8; i = i + 1) begin
            {A, B, Bin} = i;
            #10;
        end

        $finish;

    end

endmodule