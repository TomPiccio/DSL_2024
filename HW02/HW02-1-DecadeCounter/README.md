# Decade Counter

## Description

The Decade Counter counts the number of positive edges of the clock after `reset` has been turned to `0` using the `count` variable with a maximum of `4b1001`. After counting to `4b1001`, `ten` will turn to 1.

## Simulation Waveform
![Figure 1: Testbench Results](https://github.com/TomPiccio/DSL_2024/blob/main/HW02/HW02-1-DecadeCounter/DecadeCounter_Results.png)

## Design Source

```
//!DO NOT EDIT MODULE NAME AND PORT NAME!
module decade_counter(
    input clk,
    input rst,
    output [3:0] count,
    output ten
);

reg [3:0]counter  = 4'b0000;
reg ten_counter = 0;
assign count = counter;
assign ten = ten_counter;
always @(posedge clk)
begin
    if (!rst)
    begin
        if (counter < 4'b1001)
            counter <= counter + 4'b0001;
        else
        begin
            counter <= 4'b0000;
            ten_counter <= 1;
        end
    end
end

always @*
begin
    if(rst)
    begin
        counter <= 4'b0000;
        ten_counter <= 0;
    end
end

endmodule
```

## Test Bench
```
module decade_counter_tb();

reg clk;
reg rst;
wire [3:0]count;
wire ten;

decade_counter decade_counter_u0(
    .clk(clk),
    .rst(rst),
    .count(count),
    .ten(ten)
);

initial begin
    repeat(10)
    begin
        #1 clk <= 1;
        #1 clk <= 0;
    end
end

initial begin
    #0 clk <=0;
    #0 rst <= 1;
    #1 rst <= 0;
    #19 $stop;
end

endmodule
```
