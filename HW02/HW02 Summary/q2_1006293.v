//!DO NOT EDIT MODULE NAME AND PORT NAME!
module multiplexer(
    input [1:0]A,
    input [1:0]B,
    input [1:0]C,
    input [1:0]D,
    input [1:0]SEL,
    output [1:0]X
);
reg [1:0] x = 2'b00;
assign X = x;
always @(A,B,C,D, SEL)
begin
    case(SEL)
    2'b00 : x = A;
    2'b01 : x = B;
    2'b10 : x = C;
    2'b11 : x = D;
    default: x = 0;
    endcase
end
endmodule