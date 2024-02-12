`timescale 1ns / 1ps

module b3logic_tb();
    wire y;
    reg a,b;

b3logic dut(y,a,b);

initial
    begin
    #0 a=0; b=0;
    #10 a=0;b=1;
    #10 a=1;b=0;
    #10 a=1;b=1;
    #10 $stop;
    end
endmodule