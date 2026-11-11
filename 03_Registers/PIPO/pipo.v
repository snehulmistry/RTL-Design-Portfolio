module pipo(
    input wire clk,rst,load,
    input wire [3:0] pi,
    output wire [3:0] po
);
reg [3:0] data;
assign po= data;
always @(posedge clk) begin
    if (rst)
        data <=4'b0000;
    else if (load)
        data <=pi;
end
endmodule
