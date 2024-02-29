`timescale 1ns / 1ps

module top_module_tb();
    reg clk;      //100MHz Clock Source;
    reg btnR;     //BTNR - RESET System;
    wire [6:0] seg;// 7-Segment - Segment[6:0];
    wire dp;      // 7-Segment - Segment-DP;
    wire [3:0] an; // 7-Segment - Common Anode;
    
top_module a1(.clk(clk), .btnR(btnR), .seg(seg),.dp(dp),.an(an));     //BTNR - RESET System;
    always begin
    #5 clk <= 1;
    #5 clk <= 0;
end

    
    initial
    begin
        #0 clk = 0;
        #0 btnR = 1'b1;
        #100000 btnR <= 1'b0;
        repeat (3) #1000000000 btnR <= 1'b0;
        #100000 btnR <= 1'b1;
        #100000 btnR <= 1'b0;
        repeat (2) #1000000000 btnR <= 1'b1;
        #10 $stop;
        #10 $finish;
    end
        
        
endmodule