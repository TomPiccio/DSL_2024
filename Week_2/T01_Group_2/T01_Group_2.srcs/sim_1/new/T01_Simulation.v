`timescale 1ns / 1ps

module T01_Simulation();
    wire [0:0] y;
    reg [2:0] in;
     
T01_Logic out(y[0:0],in[2:0]);

initial
begin
    #0 in = 3'b000;
    #10 in = 3'b001;
    #10 in = 3'b010;
    #10 in = 3'b011;
    #10 in = 3'b100;
    #10 in = 3'b101;
    #10 in = 3'b110;
    #10 in = 3'b111;
    #10 $stop;
end

endmodule