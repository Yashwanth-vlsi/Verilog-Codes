`include"d_l.v"
module d_ff(input clk,rst,d, output Q,Qbar);
    
    d DL1(clk,rst,d,q,qbar);
    d DL2(~clk,rst,q,Q,Qbar);
endmodule

// testbench code


module d_ff_tb();
    reg clk,rst,d;
    wire Q,Qbar;

    d_ff DFF(clk,rst,d,Q,Qbar);

    initial
    clk=0;
    always #10 clk=~clk;

     initial
    begin
    rst=0;
    #6 rst=1;

    repeat(20)
    begin
    #1
    d=$random; #3;
    end
    end

 initial
    #200 $stop;

    initial
    $monitor("clk=%b rst=%b d=%b Q=%b Qbar=%b $time=%0t",clk,rst,d,Q,Qbar,$time);
    endmodule



