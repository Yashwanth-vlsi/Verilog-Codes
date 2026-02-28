module decoder_2to4(input y0,y1, output g0,g1,g2,g3);
and G1(g0,~y0,~y1);
and G2(g1,~y0,y1);
and G3(g2,y0,~y1);
and G4(g3,y0,y1);
endmodule

//testbench code 
module decoder_2to4_tb();
    reg y0,y1;
    wire g0,g1,g2,g3;
    decoder_2to4 DE(y0,y1,g0,g1,g2,g3);

    initial begin
    y0=0; y1=0; #10;
    y0=0; y1=1; #10;
    y0=1; y1=0; #10;
    y0=1; y1=1; #10;
    end
    initial
    $monitor(" y0=%0b    y1=%0b   g0=%0b   g1=%0b   g2=%0b   g3=%0b   $time=%0b",y0,y1,g0,g1,g2,g3,$time);
    endmodule




