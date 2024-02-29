# Multiplexer

## Description

The multiplexer accepts multiple inputs (`A`, `B`, `C`, and `D`) and will output `X` a selector input of `SEL`. (SEL = `A`: `00`, `B`: `01`, `C`: `10`, `D`: `11`)
>>>>>>> 8c216c17fbe0e9bee098a6db9addd0ee3be2a10d

## Simulation Waveform
![Figure 1: Testbench Results](https://github.com/TomPiccio/DSL_2024/blob/main/HW02/HW02-2-Multiplexer/Multiplexer_Results.png)

## Design Source

```
//!DO NOT EDIT MODULE NAME AND PORT NAME!
module multiplexer(
    input [1:0]A,
    input [1:0]B,
    input [1:0]C,
    input [1:0]D,
    input [1:0]SEL,
    output [1:0]X
);
reg [1:0] x = 2'b00;
assign X = x;
always @(A,B,C,D, SEL)
begin
    case(SEL)
    2'b00 : x = A;
    2'b01 : x = B;
    2'b10 : x = C;
    2'b11 : x = D;
    default: x = 0;
    endcase
end
endmodule
```

## Test Bench
```
module multiplexer_tb();
reg [1:0]A;
reg [1:0]B;
reg [1:0]C;
reg [1:0]D;
reg [1:0]SEL;
wire [1:0]X;


multiplexer m1(A,B,C,D,SEL,X);

initial
begin
    //initialize values of all reg
    #0 A <= 2'b00;
    #0 B <= 2'b01;
    #0 C <= 2'b01;
    #0 D <= 2'b11;
    #0 SEL <= 2'b00;
    
    //Setting different SEL
    #20 SEL <= 2'b01;
    #20 SEL <= 2'b10;
    #20 SEL <= 2'b11;
    
    //Changing Value different SEL
    #20 D <= 2'b01;
    #0 C <= 2'b00;
    #0 B <= 2'b11;
    #0 A <= 2'b01;
    
    //Setting different SEL
    #20 SEL <= 2'b00;
    #20 SEL <= 2'b01;
    #20 SEL <= 2'b10;
    #20 SEL <= 2'b11;
    #20 $stop;
    
end

endmodule
```
