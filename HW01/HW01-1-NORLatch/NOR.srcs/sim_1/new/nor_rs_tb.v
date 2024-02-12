module nor_rs_tb;
    wire q, qb;
    reg r,s;
    


nor_rs i1(q,qb,r,s);
initial
    begin
    r = 1; s = 0;
    #10 r = 0; s = 0;
    #10 r = 0; s = 1;
    #10 r = 0; s = 0;
    #10 $stop;
    #10 $finish;
    end
    
endmodule