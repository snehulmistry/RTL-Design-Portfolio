module Demux_1to4_tb;
reg D;
reg[1:0] S;
wire[3:0] Y;

Demux_1to4 uut(
    .D(D),
    .S(S),
    .Y(Y)
);

initial begin
    $dumpfile("Demux_1to4.vcd");
    $dumpvars(0,Demux_1to4_tb);

    //Testing

    D=1'b0; S=2'b00; #10;
    D=1'b0; S=2'b01;#10;
    D=1'b0; S=2'b10;#10;
    D=1'b0; S=2'b11; #10;
 
    D=1'b1; S=2'b00; #10;
    D=1'b1; S=2'b01;#10;
    D=1'b1; S=2'b10;#10;
    D=1'b1; S=2'b11; #10;

    $finish;
end


endmodule