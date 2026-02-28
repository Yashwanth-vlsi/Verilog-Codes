module demux_1to4(input y,[1:0]s, output [3:0]a);
    and g1(a[0],y,~s[1],~s[0]);
    and g2(a[1],y,~s[1],s[0]);
    and g3(a[2],y,s[1],~s[0]);
    and g4(a[3],y,s[1],s[0]);
endmodule

//testbench
module demux_1to4_tb();
    reg tb_y;
    reg [1:0]tb_s;
    wire [3:0]tb_a;

demux_1to4 demux(
                .y(tb_y),
                .s(tb_s),
                .a(tb_a)
                

);
initial
    repeat(30)
    begin
    tb_y=$random; tb_s=$random;  #10;
    end

initial
    $monitor("tb_y=%0b     tb_s=%0b       tb_a=%0b      $time=%t",tb_y,tb_s,tb_a,$time);
endmodule
