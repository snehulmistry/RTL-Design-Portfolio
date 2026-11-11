module tb;
logic clk;
logic rst;
logic [3:0] count;

//DUT
rtl DUT(
    .clk(clk),
    .rst(rst),
    .count(count)
);

//Clock Generation
initial clk =0;
always #5 clk=~clk;

//Testbench
initial begin 
    $dumpfile("wave.vcd");
    $dumpvars(0,tb);

    //Apply Reset
    rst=1;
    @(posedge clk);
    #1;

    if (count ==4'b1111)
        $display("Reset Passed");
    else
        $error("Reset Failed");

    rst=0;

    //Test down counting
    for (int i =14;i >=0; i--) begin
        @(posedge clk);
        #1;

        if (count !== i[3:0])
            $error("Down Counting Failed: Expected %0d,Got %0d",i,count);
    end

    $display("Down Counting Passed");

    //Test Rollover
    @(posedge clk);
    #1;

    if(count == 4'b1111)
        $display("Rollover Passed");
    else
        $error("Rollover Failed");
    
    $display("----------------------");
    $display("All Tests Completed");
    $display("----------------------");

    $finish;
end
endmodule