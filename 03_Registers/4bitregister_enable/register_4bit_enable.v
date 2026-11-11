module register_4bit_enable(
    input clk,
    input en,
    input[3:0]d,
    output reg[3:0] q
);

always @(posedge clk) begin
    if (en)
    q<=d;
    
end
endmodule