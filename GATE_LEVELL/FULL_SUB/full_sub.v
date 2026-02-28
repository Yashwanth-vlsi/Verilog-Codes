module full_sub(input a,b,bin output di,ba);
    wire [2:0]w;
    xor G1([w0],a,b);
    and G2([w1],~a,b);
    xor G3(di,[w0],bin);
    and G4 ([w2],~bin,[w0]);
    or G5(ba[w1],[w2]);
    endmodule

    module full_sub_tb();
        reg a,b,bin;
        wire di,ba;
      full_sub HS(

                a,b,bin,di,ba
                );
      initial begin
      repeat(4)
      begin
      a=$random; b=$random; bin=$random; #10;
      end
      end
      initial
      $monitor("a=%0b     b=%0b   bin=%0b     di=%0b     ba=%0b     $time=%0t",a,b,bin,di,ba,$time);
      endmodule
