module Priencoder (
    input [3:0] D,
    output [1:0] Y
);

assign Y[1] = D[3] | D[2];
assign Y[0] = D[3] | (~D[2] & D[1]);
endmodule
