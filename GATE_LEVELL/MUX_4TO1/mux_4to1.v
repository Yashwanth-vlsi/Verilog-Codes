module mux_4to1 (input [3:0]i,[1:0]s, output y);
    wire [3:0]w;
    wire s0,s1;
    and G1(w[0],~s[0],~s[1],i[0]);
    and G2(w[1],~s[0],s[1],i[1]);
    and G3(w[2],s[0],~s[1],i[2]);
    and G4(w[3],s[0],s[1],i[3]);
    or G5(y,w[0],w[1],w[2],w[3]);

 endmodule

//testbench
 module mux_4to1_tb();
    reg [3:0]tb_i;
    reg[1:0]tb_s;
    wire tb_y;
     
    //instantation
    mux_4to1 MUX(.i(tb_i),
                  .s(tb_s),
                  .y(tb_y));

 initial
    repeat(8)
    begin
    tb_s[0]=$random; tb_s[1]=$random; tb_i=$random;  #10;
 end
 initial
 $monitor("tb_i=%0b        tb_s[0]=%0b    tb_s[1]=%0b         tb_y=%0b        time=%0t",tb_i,tb_s[0],tb_s[1],tb_y,$time);
 endmodule
