`include"encoder_4to2.v"
`include"decoder_2to4.v"
module encode_decode_4to4(input d0,d1,d2,d3, output g0,g1,g2,g3);
    encoder_4to2 EN(d0,d1,d2,d3,y0,y1);
    decoder_2to4 DC(y0,y1,g0,g1,g2,g3);
endmodule
//testbench
module encode_decode_4to4_tb();
    reg d0,d1,d2,d3;
    wire g0,g1,g2,g3;
    encode_decode_4to4 ED(d0,d1,d2,d3,g0,g1,g2,g3);
    initial begin
    d0=1; d1=0; d2=0; d3=0; #10;
    d0=0; d1=1; d2=0; d3=0; #10;
    d0=0; d1=0; d2=1; d3=0; #10;
    d0=0; d1=0; d2=0; d3=1; #10;
    end
 initial
    $monitor("d0=%0b      d1=%0b      d2=%0b      d3=%0b      g0=%0b      g1=%0b     g2=%0b     g3=%0b     $time=%0t",d0,d1,d2,d3,g0,g1,g2,g3,$time);
 endmodule



