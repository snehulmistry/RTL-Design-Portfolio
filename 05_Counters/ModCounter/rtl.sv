module rtl #(
    parameter N = 10,
    parameter WIDTH =4
)(
    input logic clk,
    input logic rst,
    output logic [ WIDTH-1:0] count
);

always_ff @(posedge clk) begin
    if (rst)
        count <=0;
    else if (count ==N-1)
        count <=0;
    else
        count <= count + 1'b1;
end
endmodule