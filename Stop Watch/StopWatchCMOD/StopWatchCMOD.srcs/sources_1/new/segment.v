module segment(
    input rstn,
    input clk,
    input [15:0] seg_data,
    output [3:0] AN,
    output [7:0] C_segment
);

reg [7:0] segment_r;        //Register - Drive 7 Segment
assign C_segment[7] =  seg_data[0];  //Connnect Register(7-Segment) to Segment Pin-DP
assign C_segment[6:0] = ~segment_r[6:0];   //Connnect Register(7-Segment) to Segment Pin (seg[6:0])
reg [3:0] cur_num_r;        //Register - BCD Number Display at this moment; 
wire [15:0] bcd_num;        //Wire - 4 BCD Number;
reg [3:0] an_r;             //Register - Drive Common Anode;
assign AN = ~an_r;          

always @(negedge rstn,posedge clk)begin
    if(!rstn)begin
        an_r <= 4'b0000;    //When system reset, empty all display;
    end
    else begin
        case(an_r)                  
        4'b0001: an_r <= 4'b0010;   //DISPLAY ON DIG3
        4'b0010: an_r <= 4'b0100;   //DISPLAY ON DIG2
        4'b0100: an_r <= 4'b1000;   //DISPLAY ON DIG1
        default: an_r <= 4'b0001;   //DISPLAY ON DIG4
        endcase
    end
end

always @(an_r,seg_data)begin
    case(an_r)
        4'b0001: cur_num_r <= seg_data[3:0];
        4'b0010: cur_num_r <= seg_data[7:4];
        4'b0100: cur_num_r <= seg_data[11:8];
        4'b1000: cur_num_r <= seg_data[15:12];
        default: cur_num_r <= 4'b0;
    endcase    
end

always @(cur_num_r) begin
    case(cur_num_r)
        4'h0:segment_r <= 8'hc0;    //NUM "0"
        4'h1:segment_r <= 8'hf9;    //NUM "1"
        4'h2:segment_r <= 8'ha4;    //NUM "2"
        4'h3:segment_r <= 8'hb0;    //NUM "3"
        4'h4:segment_r <= 8'h99;    //NUM "4"
        4'h5:segment_r <= 8'h92;    //NUM "5"
        4'h6:segment_r <= 8'h82;    //NUM "6"
        4'h7:segment_r <= 8'hF8;    //NUM "7"
        4'h8:segment_r <= 8'h80;    //NUM "8"
        4'h9:segment_r <= 8'h90;    //NUM "9"
        default: segment_r <= 8'hff;
    endcase
end

endmodule