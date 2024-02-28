# Demultiplexer

## Description

It functions as the opposite of multiplexer. It has 2 inputs `A` and `SEL`. The output will appear on one of the outputs (SEL = `00` : `A`, `01`:`B`, `10`:`C`, and `11`:`D`).

## Simulation Waveform
![Figure 1: Testbench Results](https://github.com/TomPiccio/DSL_2024/blob/main/HW02/HW02-3-Demultiplexer/Demultiplexer_Results.png)

## Design Source

```
//!DO NOT MODIFY MODULE NAME AND PORT NAME!
module demultiplexer(
    input [1:0]A,
    input [1:0]SEL,
    output [1:0]W,
    output [1:0]X,
    output [1:0]Y,
    output [1:0]Z
    );
    
assign W = (SEL[1:0] == 2'b00) ?  A[1:0] : 2'b00;
assign X = (SEL[1:0] == 2'b01) ?  A[1:0] : 2'b00;
assign Y = (SEL[1:0] == 2'b10) ?  A[1:0] : 2'b00;
assign Z = (SEL[1:0] == 2'b11) ?  A[1:0] : 2'b00;

endmodule
```

## Test Bench
```
//!DO NOT MODIFY MODULE NAME AND PORT NAME!
module demultiplexer_tb();
reg [1:0]A;
reg [1:0]SEL;
wire [1:0]W;
wire [1:0]X;
wire [1:0]Y;
wire [1:0]Z;

demultiplexer d1(A,SEL,W,X,Y,Z);

initial
begin
    #0 A <= 0;
    #0 SEL <= 0;
    #10 A <= 1;
    #0 SEL <= 1;
    #10 SEL <= 2;
    #10 A <= 3;
    #0 SEL <= 3;
    #10 $stop;    
end

endmodule
```
