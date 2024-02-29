module timer_tb();
    reg rstn;
    reg clk; //1hz
    wire [15:0] bcd_tim;
    
    timer t1(rstn, clk, bcd_tim);
    
    //assume 1 unit time is 0.5s
    
    always
    begin
        #1 clk <= 0;
        #1 clk <= 1;
    end
    
    initial
    begin
        #0 rstn <= 0;
        #0 clk <= 0;
        #10 rstn <= 1;
        #8000 rstn <= 0;
        #10 rstn <= 1;
        #100 $stop;
        #10 $finish;
    end
    
endmodule