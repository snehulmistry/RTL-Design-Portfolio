module piso(
    input clk,
    input load,
    input rst,
    input wire [3:0] pi,
    output wire so
);
reg [3:0] data;
assign so =data[0];

always @(posedge clk) begin
    if (rst)
        data = 4'b000;
    else if (load)
        data <=pi;
    else
        data <={1'b0,data[3:1]};
end
endmodule        