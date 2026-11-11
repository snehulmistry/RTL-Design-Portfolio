module piso_tb;

    reg clk, rst, load;
    reg [3:0] pi;
    wire so;

    piso uut (
        .clk(clk),
        .rst(rst),
        .load(load),
        .pi(pi),
        .so(so)
    );

    // Clock generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    // Test stimulus
    initial begin
        $dumpfile("wave.vcd");
        $dumpvars(0, piso_tb);

        $monitor("Time=%0t | rst=%b load=%b pi=%b so=%b",
                 $time, rst, load, pi, so);

        rst = 1;
        load = 0;
        pi = 4'b0000;

        @(negedge clk);
        rst = 0;

        // Load parallel data
        pi = 4'b1011;
        load = 1;

        @(negedge clk);
        load = 0;

        // Shift out the data
        repeat (4)
            @(negedge clk);

        $finish;
    end

endmodule