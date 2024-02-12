`timescale 1ns / 1ps

module T01_Logic(
    output [0:0] led,
    input [2:0] sw
);

reg out = 1'b0;

always @(*) out = (sw[0]&sw[1])|sw[2];

assign led[0] = out;

endmodule
