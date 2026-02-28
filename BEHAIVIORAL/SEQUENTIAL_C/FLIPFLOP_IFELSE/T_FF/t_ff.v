`include"t_l.v"
module t_ff(input clk,rst,t, output Q,Qbar);
    
    t TL1(clk,rst,t,q,qbar);
    t TL2(~clk,rst,q,Q,Qbar);

endmodule

// testbench code

module t_ff_tb();
    reg clk,rst,t;
    wire Q,Qbar;

    t_ff TF(clk,rst,t,Q,Qbar);

    initial clk=0;
    always #10 clk=~clk;

    initial
    begin
    rst=0;
    #3 rst=1;

    repeat(30)
    begin
    #3
    t=$random; #4;
    end
    end

    initial
    #200 $stop;

    initial
    $monitor("clk=%b rst=%b t=%b Q=%b Qbar=%b $time=%0t",clk,rst,t,Q,Qbar,$time);
    endmodule


