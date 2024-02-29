`timescale 1ns / 1ps

module top_module(
    input clk,      //100MHz Clock Source;
    input btnR,     //BTNR - RESET System;
    input btnPause,     //BTNPause - PAUSE System;
    output [6:0] seg,// 7-Segment - Segment[6:0];
    output dp,      // 7-Segment - Segment-DP;
    output [3:0] an, // 7-Segment - Common Anode;
    output [1:0] led,
    output led0_r,
    output led0_g
);
  
wire rstn;
assign rstn=~btnR;

wire btnPauseN;
assign btnPauseN = ~btnPause;

wire clk_1hz;
wire clk_500hz;
wire [15:0] bcd_time;
wire [7:0] Csegment;
wire led_r, led_g;
clk_tree clk_tree_0(clk,rstn,btnPauseN,clk_500hz,clk_1hz,led_r, led_g);
timer timer_0(rstn,clk_1hz,bcd_time);
segment segment_0(rstn,clk_500hz,bcd_time,an,Csegment);

assign led0_r = led_r;
assign led0_g = led_g;
assign seg[6:0] = Csegment[6:0];
assign dp = Csegment[7];
assign led[0] = bcd_time[0]; //Second Unit modulus 2
assign led[1] = ~bcd_time[0]; //Second Unit modulus 2


endmodule