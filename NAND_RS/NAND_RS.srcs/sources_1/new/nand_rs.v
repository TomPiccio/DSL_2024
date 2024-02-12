module nand_rs(q,qb,s,r);
    output q,qb;
    input s,r;

nand #1 g1(q,s,qb);
nand #1 g2(qb,q,r);

endmodule