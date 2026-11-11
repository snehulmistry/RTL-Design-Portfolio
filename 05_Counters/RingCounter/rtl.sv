module rtl(
    input logic clk,
    input logic rst,
    output logic [3:0] count
);

always_ff @(posedge clk) begin
    if(rst)
        count <=4'b0001;
    else
        count <= {count[2:0], count[3]};
end
endmodule