//!DO NOT MODIFY MODULE NAME AND PORT NAME!
module nibbleadd(
    input [7:0]A,
    input [7:0]B,
    input ctrl,
    output [4:0]q
);

reg [4:0] out = 4'b0000;

assign q = out;

always @(ctrl,A,B)
begin
    if(ctrl)
    begin
        out <= A[7:4]+B[7:4];
    end
    else
    begin
        out <= A[3:0]+B[3:0];
    end
end
    

//YOUR CODE HERE
endmodule