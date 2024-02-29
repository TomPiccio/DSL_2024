`timescale 1ns / 1ps
module clk_tree(
    input clk,
    input rstn,
    input btnPauseN,
    output clk_500hz_r_out,
    output clk_1hz_r_out,
    output led_r,
    output led_g
);

reg [13:0]cnter_500hz_r;    // 12Mhz/(500Hz*2) =  12_000(14 bits);
reg [7:0] cnter_1hz_r;      // 500Hz/(1Hz*2) = 250 (8 bits)
reg [7:0] cnter_1hz_2;      // 500Hz/(1Hz*2) = 250 (8 bits)
reg clk_500hz_r;
reg clk_1hz_r;
reg clk_1hz_2;

assign clk_500hz_r_out = clk_500hz_r;
assign clk_1hz_r_out = clk_1hz_r;

reg btn_Pause;

//LED Variables
reg led_r_reg = 255;
reg led_g_reg = 255;
assign led_r = led_r_reg;
assign led_g = led_g_reg;

always@(posedge clk, negedge rstn)begin
    if(!rstn)begin              //Non-Sync Reset
        clk_500hz_r <= 1'b0;    //Set 500hz clock as '0' to avoid any uncertain status;        
        cnter_500hz_r <= 17'd0; //Clear counter
    end
    else begin
        if(cnter_500hz_r == 17'd12_000-1'b1)begin   //When counter reach 12_000
            clk_500hz_r <= ~clk_500hz_r;        //Toggle 500Hz CLk reg;
            cnter_500hz_r <= 17'd0;             //Clear counter
        end
        else
            cnter_500hz_r <= cnter_500hz_r +1'b1; //Counter
    end
end

//Create 2 1Hz (One pausable, One Continuous) Clock from 500Hz Clock Source;
always@(posedge clk_500hz_r, negedge rstn)begin
    if(!rstn)begin
        clk_1hz_r <= 1'b0;
        cnter_1hz_r <= 8'd0;
        led_r_reg <= 255;
        led_g_reg <= 255;
        clk_1hz_2 <= 1'b0;
        cnter_1hz_2 <= 8'd0;
    end
    else begin
        if(cnter_1hz_2 == 8'd250-1'b1)begin
            clk_1hz_2 <= ~clk_1hz_2;
            cnter_1hz_2 <= 8'd0;
        end
        else
            cnter_1hz_2 <= cnter_1hz_2 +1'b1;
        if(!btn_Pause)
        begin
            led_r_reg <= 255;
            led_g_reg <= 0;
            if(cnter_1hz_r == 8'd250-1'b1)begin
                clk_1hz_r <= ~clk_1hz_r;
                cnter_1hz_r <= 8'd0;
            end
            else
                cnter_1hz_r <= cnter_1hz_r +1'b1;
        end
        else
        begin
            led_r_reg <= 0;
            led_g_reg <= 255;
        end
    end   
end

always@(posedge clk_1hz_2, negedge rstn)
begin
    if(!rstn)begin
        btn_Pause <= 0;
    end
    else
    begin
        if(!btnPauseN) begin
            btn_Pause <= ~btn_Pause;
        end 
    end  
end

endmodule