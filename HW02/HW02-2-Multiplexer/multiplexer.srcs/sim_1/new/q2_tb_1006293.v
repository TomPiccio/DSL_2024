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