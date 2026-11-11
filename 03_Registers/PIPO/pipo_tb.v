`timescale 1ns/1ps

module pipo_tb;
reg clk,rst,load;
reg [3:0] pi;
wire [3:0] po;


pipo uut(
    .clk(clk),
    .load(load),
    .rst(rst),
    .pi(pi),
    .po(po)
);

initial begin
    clk =0;
    forever #5  clk=~clk;
end

initial begin
    $dumpfile("wave.vcd");
    $dumpvars(0,pipo_tb);
end

initial begin
    $monitor("Time=%0t | rst=%b load=%b pi=%b po=%b",
                 $time, rst, load, pi, po);

    rst =1;
    load=0;
    pi=4'b0000;

    @(negedge clk) ;
    rst=0;
    //Test1:Parallel Load
    pi=4'b1011;
    load=1;

    @(negedge clk);
    //Test2:Hold Previous Data
    load=0;
    pi=4'b0101;

    @(negedge clk);
    //Test3: Load new data
    load=1;
    pi=4'b1100;

    @(negedge clk);
    //Test4:Hold new data
    load=0;
    pi=4'b1111;

    @(negedge clk);
    $finish;
end
endmodule


    

