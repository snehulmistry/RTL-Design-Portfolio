module alu(
    input [3:0] A,
    input [3:0] B,
    input [2:0] OP,
    output reg [3:0] RESULT
);

always @(*) begin
    case (OP)
        3'b000: RESULT = A + B;   // ADD
        3'b001: RESULT = A - B;   // SUB
        3'b010: RESULT = A & B;   // AND
        3'b011: RESULT = A | B;   // OR
        3'b100: RESULT = A ^ B;   // XOR
        3'b101: RESULT = ~A;      // NOT
        default: RESULT = 4'b0000;
    endcase
end

endmodule