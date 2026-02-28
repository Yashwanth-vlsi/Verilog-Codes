module jk_ff(
    input j,k,
    output q,qbqr
);
    wire w0,w1;

    nand G1(w0,j,qbar);
    nand G2(q,w0,qbar);
    nand G3(w1,k,q);
    nand G4(qbar,k,w1);
endmodule

//testbench code

module jk_ff_tb();
    reg j,k;
    wire q,qbar;
    jk_ff JK(j,k,q,qbar);
    initial
    repeat(5)
    begin
    j=$random; k=$random; #10;
    end
    initial
    $monitor("j=%0b k=%0b q=%0b qbar=%0b",j,k,q,qbar);
    endmodule
