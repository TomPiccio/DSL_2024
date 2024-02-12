`timescale 1ns / 1ps

module full_adder_tb();
    wire [1:0] y;
    reg [2:0] in;

full_adder device(y[1:0],in[2:0]);

initial
begin
    #0 in <= 3'b000;
    #10 in <= 3'b001;
    #10 in <= 3'b010;
    #10 in <= 3'b011;
    #10 in <= 3'b100;
    #10 in <= 3'b101;
    #10 in <= 3'b110;
    #10 in <= 3'b111;
    #10 $stop;
    #10 $finish;
end

endmodule