`include"jk_l.v"
module jk_ff(input clk,rst,j,k, output Q,Qbar);

    jk JK1(clk,rst,j,k,q,qbar);
    jk JK2(~clk,rst,q,qbar,Q,Qbar);
endmodule

// testbench code

module jk_ff_tb();
    reg clk,rst,j,k;
    wire Q,Qbar;

    jk_ff JKF(clk,rst,j,k,Q,Qbar);

     initial clk=0;
    always #5 clk=~clk;

    initial
  begin
    rst=0;
    #5 rst=1;

    repeat(20)
    begin
    j=$random; k=$random; #5;
    end
    end
    initial
    #200 $stop;

    initial
    $monitor("clk=%b rst=%b j=%b k=%b Q=%b Qbar=%b $time=%0t",clk,rst,j,k,Q,Qbar,$time);
    endmodule
