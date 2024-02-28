module nibbleadd_tb();
reg [7:0]A;
reg [7:0]B;
reg  ctrl;
wire [4:0]q;

nibbleadd n1(A,B,ctrl,q);

initial
begin
    #0 A <= 8'h24;
    #0 B <= 8'h81;
    #0 ctrl <= 0;
    #10 A <= 8'h09;
    #0 B <= 8'h63;
    #10 A <= 8'h0d;
    #0 B <= 8'h8d;
    #10 A <= 8'h65;
    #0 B <= 8'h12;
    #10 A <= 8'h01;
    #0 B <= 8'h0d;
    #10 A <= 8'h76;
    #0 B <= 8'h3d;
    #0 ctrl <= 1;
    #10 A <= 8'hed;
    #0 B <= 8'h8c;
    #10 A <= 8'hf9;
    #0 B <= 8'hc6;
    #10 A <= 8'hc5;
    #0 B <= 8'haa;
    #10 A <= 8'he5;
    #0 B <= 8'h77;
    #10 A <= 8'h12;
    #0 B <= 8'h8f;
    #10 A <= 8'hff;
    #0 B <= 8'hff;
    #10 $stop;
end

endmodule
