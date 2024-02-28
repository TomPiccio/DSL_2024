module CCTA_tb();
reg [3:0] A;
reg [3:0] B;
reg [3:0] C;
reg rst;
reg ctrl;
wire [4:0] q;

CCTA C1(A,B,C,rst,ctrl,q);

initial
begin
    #0 A <= 4'h4;
    #0 B <= 4'h1;
    #0 C <= 4'h9;
    #0 rst <= 1;
    #0 ctrl <= 0;
    #10 rst <= 0;
    #10 A <= 4'h3;
    #0 B <= 4'hd;
    #0 C <= 4'hd;
    #10 A <= 4'h5;
    #0 B <= 4'h2;
    #0 C <= 4'h1;
    #10 A <= 4'hd;
    #0 B <= 4'h6;
    #0 C <= 4'hd;
    #10 B <= 4'hc;
    #0 C <= 4'h9;
    #10 A <= 4'h6;
    #0 B <= 4'h5;
    #0 C <= 4'ha;
    #0 ctrl <= 1;
    #10 A <= 4'h5;
    #0 B <= 4'h7;
    #0 C <= 4'h2;
    #10 A <= 4'hf;
    #0 B <= 4'h2;
    #0 C <= 4'he;
    #10 A <= 4'h8;
    #0 B <= 4'h5;
    #0 C <= 4'hc;
    #10 A <= 4'hd;
    #0 B <= 4'hd;
    #0 C <= 4'h5;
    #10 A <= 4'h3;
    #0 B <= 4'ha;
    #0 C <= 4'h0;
    #10 $stop;    
end

endmodule