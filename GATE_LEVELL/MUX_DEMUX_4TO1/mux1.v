module mux_4to1(input [3:0]a,[1:0]s, output y);
    wire [3:0]w;
    wire s0,s1;
    and G1(w[0],~s[1],~s[0],a[0]);
    and G2(w[1],~s[1],s[0],a[1]);
    and G3(w[2],s[1],~s[0],a[2]);
    and G4(w[3],s[1],s[0],a[3]);
    or G5(y,w[0],w[1],w[2],w[3]);

 endmodule

//testbench
 module mux_4to1_tb();
    reg [3:0]tb_a;
    reg[1:0]tb_s;
    wire tb_y;
     
    //instantation
    mux_4to1 MUX(.a(tb_a),
                  .s(tb_s),
                  .y(tb_y)
                  );

 initial
    repeat(8)
    begin
    tb_s=$random; tb_a=$random;  #10;
 end
 initial
 $monitor("tb_a=%0b        tb_s=%0b         tb_y=%0b        time=%0t",tb_i,tb_s,tb_y,$time);
 endmodule
