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

always begin
    #10 clk <= 1;
    #10 clk <= 0;
end

initial begin
    #0 clk <=0;
    #0 rst <= 1;
    #30 rst <= 0;
    #220 rst <= 1;
    #30 rst <= 0;
    #100 $stop;
end

endmodule