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