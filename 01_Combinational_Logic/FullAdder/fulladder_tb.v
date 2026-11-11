module fulladder_tb;
    reg A;
    reg B;
    reg Cin;
    wire Sum;
    wire Cout;

integer i;
fulladder uut(
    .A(A),
    .B(B),
    .Cin(Cin),
    .Sum(Sum),
    .Cout(Cout)
);

initial begin
    
    $dumpfile("fulladder_waveform.vcd");
    $dumpvars(0, fulladder_tb);

    //Testing using a loop
    
    for(i=0;i<8;i=i+1)begin
        {A,B,Cin} = i;#10;

    end
    $finish;
end
endmodule