module decoder_2to4(input y0,y1, output d0,d1,d2,d3);
and G1(d0,~y0,~y1);
and G2(d1,~y0,y1);
and G3(d2,y0,~y1);
and G4(d3,y0,y1);
endmodule

//testbench code 
module decoder_2to4_tb();
    reg y0,y1;
    wire d0,g1,d2,d3;
    decoder_2to4 DE(y0,y1,d0,d1,d2,d3);

    initial begin
    y0=0; y1=0; #10;
    y0=0; y1=1; #10;
    y0=1; y1=0; #10;
    y0=1; y1=1; #10;
    end
    initial
    $monitor(" y0=%0b    y1=%0b   d0=%0b   d1=%0b   d2=%0b   d3=%0b   $time=%0b",y0,y1,d0,d1,d2,d3,$time);
    endmodule




