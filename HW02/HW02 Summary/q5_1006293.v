//!DO NOT MODIFY MODULE NAME AND PORT NAME!
module CCTA(
        input [3:0] A,
        input [3:0] B,
        input [3:0] C,
        input rst,
        input ctrl,
        output [4:0] q
);

reg [4:0] out = 4'b0000;

assign q = out;

always @(A,B,C,rst,ctrl)
begin
    if (!rst)
    begin
        case(ctrl)
            0: out <= A+B;
            1: out <= A-C;
        endcase
    end
    else
    out <= 4'b0000;
end

endmodule