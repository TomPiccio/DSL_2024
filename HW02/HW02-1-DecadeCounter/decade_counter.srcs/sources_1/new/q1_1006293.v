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
    if(rst)
    begin
        counter <= 4'b0000;
        ten_counter <= 0;
    end
    else
    begin
        if (counter < 4'b1001)
        begin
            counter <= counter + 4'b0001;
            ten_counter <= 0;
        end
        else
        begin
            counter <= 4'b0000;
            ten_counter <= 1;
        end
    end
end

endmodule