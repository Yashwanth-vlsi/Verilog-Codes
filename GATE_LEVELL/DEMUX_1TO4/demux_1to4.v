module demux_1to4(input i,s0,s1, output [3:0]y);

    and g1(y[0],i,~s0,~s1);
    and g2(y[1],i,~s0,s1);
    and g3(y[2],i,s0,~s1);
    and g4(y[3],i,s0,s1);
endmodule

//testbench
module demux_1to4_tb();
    reg tb_i,tb_s0,tb_s1;
    wire [3:0]tb_y;

demux_1to4 demux(
                .i(tb_i),
                .s0(tb_s0),
                .s1(tb_s1),
                .y(tb_y)
                

);
initial
    repeat(30)
    begin
    tb_i=1; tb_s0=$random % 2; tb_s1=$random % 2; #10;
    end

initial
    $monitor("tb_i=%0b     tb_s0=%0b      tb_s1=%0b      tb_y=%0b      $time=%t",tb_i,tb_s0,tb_s1,tb_y
    ,$time);
endmodule
