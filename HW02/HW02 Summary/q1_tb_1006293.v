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
    #0 clk <=0;
    #0 rst <= 1;
    #1 clk <= 1;
    #1 clk <= 0;
    #0 rst <= 0;
    repeat(13)
    begin
        #1 clk <= 1;
        #1 clk <= 0;
    end
    #1 clk <= 1;
    #0 $stop;
end

endmodule