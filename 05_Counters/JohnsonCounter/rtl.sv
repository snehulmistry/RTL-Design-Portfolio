module rtl(
    input logic clk,
    input logic rst,
    output logic[3:0] count
);

always_ff @( posedge clk ) begin : blockName
    if(rst)
        count <=4'b0000;
    else
        count <= {count[2:0], ~count[3]};
end