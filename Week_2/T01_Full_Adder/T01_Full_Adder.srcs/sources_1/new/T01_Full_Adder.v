`timescale 1ns / 1ps

module full_adder(output [1:0] led, input [2:0] sw);

reg [1:0] sum;

always @(*)
begin
sum[0] <= (sw[0]^sw[1])^sw[2];
sum[1] <= (sw[0]&sw[1])|(sw[1]&sw[2])|(sw[0]&sw[2]);
end

assign  led[1:0] = sum[1:0];

endmodule