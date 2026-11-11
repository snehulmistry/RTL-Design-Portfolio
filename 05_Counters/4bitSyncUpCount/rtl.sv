module rtl(
    input logic rst,
    input logic clk,
    input logic up_down,
    output logic [3:0] count,
);

always_ff @(posedge clk) begin
    if(rst)
        count <=4'b0000;
    else if (up_down)
        count <= count + 1'b1;
    else   
        count <= count -1'b1;
end
endmodule