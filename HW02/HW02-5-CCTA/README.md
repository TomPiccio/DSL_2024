# Conditional Carry and Transfer Adder (CCTA)

## Description

The CCTA sums up `A` and `B` when `ctrl` is `0` and `A` and `C` when `ctrl` is `1`. The value of `q` (output) will be set to 0 when `rst` is 1.

## Simulation Waveform
![Figure 1: Testbench Results](https://github.com/TomPiccio/DSL_2024/blob/main/HW02/HW02-5-CCTA/CCTA_Results.png)

## Design Source

```
//!DO NOT MODIFY MODULE NAME AND PORT NAME!
module CCTA(
        input [3:0] A,
        input [3:0] B,
        input [3:0] C,
        input rst,
        input ctrl,
        output [4:0] q
);

reg [4:0] out = 4'b0000;

assign q = out;

always @(A,B,C,rst,ctrl)
begin
    if (!rst)
    begin
        case(ctrl)
            0: out <= A+B;
            1: out <= A-C;
        endcase
    end
    else
    out <= 4'b0000;
end

endmodule
```

## Test Bench
```
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
```
