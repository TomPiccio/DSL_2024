module timer(
    input rstn,
    input clk, //1hz
    output [15:0] bcd_tim
);
    // Timer Section is composed with 4 BCD Number counter(Minute Decade,Minute Unit, Second Decade, Second Unit);
    reg [3:0] sec_unit_bcd_r,sec_deca_bcd_r,min_unit_bcd_r,min_deca_bcd_r; //Register - (Minute Decade,Minute Unit, Second Decade, Second Unit);
    reg sec_unit_cout,sec_deca_cout,min_unit_cout; //Carry Out Signal, When 4 BCD Number counter reach upper limit, it will generate a cout signal;
    
    always @(negedge clk or negedge rstn)begin
        if(!rstn)begin
            sec_unit_bcd_r <= 4'd0; //Clear BCD Number Counter;
            sec_unit_cout <= 1'b0;  //Clear Cout Signal;
        end
        else begin
            if(sec_unit_bcd_r == 4'h9)begin
                sec_unit_cout <= 1'b1;  //Cout generate a posedge;
                sec_unit_bcd_r <= 4'd0; //Clear BCD Number Counter;
            end
            else begin
                sec_unit_cout <= 1'b0;                      //Clear Cout Signal;
                sec_unit_bcd_r <= sec_unit_bcd_r + 1'b1; // BCD Number Counter increase by '1';
            end
        end
    end
    
    always @(posedge sec_unit_cout or negedge rstn)begin
        if(!rstn)begin
            sec_deca_bcd_r <= 4'd0;
            sec_deca_cout <= 1'b0;
        end
        else begin
            if(sec_deca_bcd_r == 4'h5)begin
                sec_deca_cout <= 1'b1;
                sec_deca_bcd_r <= 4'd0;
            end
            else begin
                sec_deca_cout <= 1'b0;
                sec_deca_bcd_r <= sec_deca_bcd_r + 1'b1;
            end
        end
    end
    
    always @(posedge sec_deca_cout or negedge rstn)begin
        if(!rstn)begin
            min_unit_bcd_r <= 4'd0;
            min_unit_cout <= 1'b0;
        end
        else begin
            if(min_unit_bcd_r == 4'h9)begin
                min_unit_cout <= 1'b1;
                min_unit_bcd_r <= 4'd0;
            end
            else begin
                min_unit_cout <= 1'b0;
                min_unit_bcd_r <= min_unit_bcd_r + 1'b1;
            end
        end
    end
    
    always @(posedge min_unit_cout or negedge rstn)begin
        if(!rstn)begin
            min_deca_bcd_r <= 4'd0;
        end
        else begin
            if(min_deca_bcd_r == 4'h5)begin
                min_deca_bcd_r <= 4'd0;
            end
            else begin
                min_deca_bcd_r <= min_deca_bcd_r + 1'b1;
            end
        end
    end
    
    assign  bcd_tim[15:12]  = min_deca_bcd_r;
    assign  bcd_tim[11:8]   = min_unit_bcd_r;
    assign  bcd_tim[7:4]    = sec_deca_bcd_r;
    assign  bcd_tim[3:0]    = sec_unit_bcd_r;
endmodule