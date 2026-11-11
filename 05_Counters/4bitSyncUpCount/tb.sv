module tb;
logic clk;
logic rst;
logic up_down;
logic [3:0] count;

//DUT
rtl DUT(
    .clk(clk),
    .rst(rst),
    .up_down(up_down),
    .count(count)
);

//Clock generation
initial begin
    clk = 0;
    always #5 clk=~clk;
end
//Dumping
initial begin
    $dumpfile("wave.vcd");
    $dumpvars(0,tb);
end

//Task checking
task check(input logic [3:0] expected);
begin
    @(posedge clk);
    #1;

    if (count !== expected) begin
        $display("FAILED: Expected %0d, Got %0d,
        expected,count");
        $fatal
    end
    else begin
        $display("PASSED: Count =%0d",count);
    end
end
endtask

//Test Cases
initial begin

    rst=1;
    up_down=1;

    check(4'd0);
    $display("Reset Passed");

    rst=0;
    //Up_Counting
    up_down=1;

    check(4'd1);
    check(4'd2);
    check(4'd3);
    check(4'd4);
    $display("Up counting Passed");

    //UP Rollover
    repeat(11) check(count +1'b1);
    check(4'd0);
    $display("Up Rollover Passed");

    //Down Counting
    up_down=0;
    check(4'd15);
    check(4'd14);
    check(4'd13);
    $display("Down Counting Passed");

    //Down Rollover
    rst =1;
    check(4'd0);
    rst=0;
    up_down =0;
    check(4'd15);
    $display("Down Rollover Passed");

    //Direction Switching
    up_down=1;
    check(4'd0);

    up_down=0;
    check(4'd15);

    $display("Direction Switching Passed");

    //Reset during counting
    rst=1;
    check(4'd0);

    $display("All tests Passed");
    $finish;
end
endmodule
