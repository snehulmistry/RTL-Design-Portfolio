module register_4bit_enable_tb;
reg clk;
reg en;
reg[3:0]d;
wire[3:0]q;

register_4bit_enable uut(
    .clk(clk),
    .en(en),
    .d(d),
    .q(q)
);

//Clock Generation
always #5 clk= ~clk;

//Waveform Dumping
initial begin
    $dumpfile("waveform.vcd");
    $dumpvars(0,register_4bit_enable_tb);
end
//Task Checking
task check_output;
    input[3:0] expected_q;
    begin
        #1;

        if(q !== expected_q)
            $display("FAIL: Expected=%b | Actual=%b",
                     expected_q, q);
        else
            $display("PASS: Expected=%b | Actual=%b",
                     expected_q, q);
    end
endtask

//Testing
initial begin
    #1;
    clk=0;
    en=0;
    d=4'b0000;

    //Test1:Enable=1,load data
    en = 1;
    d = 4'b1010;
    #10;
    check_output(4'b1010);

    //Test2:Enable=0,hold previous value
    en=0;
    d=4'b0101;
    #10;
    check_output(4'b1010);

    //Test3:Enable = 1,load new data
    en=1;
    d=4'b1111;
    #10;
    check_output(4'b1111);

    //Test4: Enable=0,hold previous value
    en=0;
    d=4'b0000;
    #10;
    check_output(4'b1111);

    $finish;

end
endmodule
