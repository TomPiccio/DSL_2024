`timescale 1ns / 1ps

module b3logic(y,a,b);
    output y;
    input a,b;
    
assign y = a & b;

endmodule