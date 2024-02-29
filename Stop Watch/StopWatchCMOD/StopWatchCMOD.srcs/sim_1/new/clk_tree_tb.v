module clk_tree_tb();
    reg clk;
    reg rstn;
    reg btnPauseN;
    wire clk_500hz_r_out, clk_1hz_r_out, rst, led_r, led_g;
    
    assign rst = ~rstn;
    //top_module top_module_0(clk, rst, btnPause_in);
    clk_tree clk_tree_0(clk,rstn,btnPauseN,clk_500hz,clk_1hz,led_r, led_g);
    assign clk_500hz_r_out = clk_tree_0.clk_500hz_r_out;
    assign clk_1hz_r_out = clk_tree_0.clk_1hz_r_out;
    always
    begin
        #1 clk <= 0;
        #1 clk <= 1;
    end
    
    initial
    begin
        #0 rstn <= 0;
        #0 btnPauseN <= 1;
        #10 rstn <= 1;
        #54000000 btnPauseN <= 0;
        #1000000 btnPauseN <= 1;
        #48000000 btnPauseN <= 0;
        #1000000 btnPauseN <= 1;
        #12000000  $stop;
        #10 $finish;        
    end
endmodule
