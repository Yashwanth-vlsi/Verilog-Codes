module half_sub(input a,b, output di,ba);
    wire w;
    xor G1(di,a,b);
    not G2(w,a);
    and G3(ba,w,b);
    endmodule

    module half_sub_tb();
        reg a,b;
        wire di,ba;
      half_sub HS(

                a,b,di,ba
                );
      initial begin
      repeat(4)
      begin
      a=$random; b=$random; #10;
      end
      end
      initial
      $monitor("a=%0b     b=%0b     di=%0b     ba=%0b     $time=%0t",a,b,di,ba,$time);
      endmodule
