//!DO NOT MODIFY MODULE NAME AND PORT NAME!
module demultiplexer(
    input [1:0]A,
    input [1:0]SEL,
    output [1:0]W,
    output [1:0]X,
    output [1:0]Y,
    output [1:0]Z
    );
    
assign W = (SEL[1:0] == 2'b00) ?  A[1:0] : 2'b00;
assign X = (SEL[1:0] == 2'b01) ?  A[1:0] : 2'b00;
assign Y = (SEL[1:0] == 2'b10) ?  A[1:0] : 2'b00;
assign Z = (SEL[1:0] == 2'b11) ?  A[1:0] : 2'b00;

endmodule