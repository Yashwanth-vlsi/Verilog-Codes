`include"sr_l.v"
module sr_ff(input clk,rst,S,R, output Q,Qbar);
    
   sr_l SR1(clk,rst,S,R,q,qbar);
   sr_l SR2(~clk,rst,q,qbar,Q,Qbar);

endmodule

//testbench code

module sr_ff_tb();
    reg clk,rst,S,R;
    wire Q,Qbar;

sr_ff SRFF(clk,rst,S,R,Q,Qbar);

    initial clk=0;
    always #5 clk=~clk;

    initial
  begin
    rst=0;
    #5 rst=1;

    repeat(40)
    begin
#2
    S=0; R=0; #5;
    S=0; R=1; #5;
    S=1; R=0; #5;
    S=1; R=1; #5;
    end 
  end

initial
    #200 $stop;

initial
    $monitor("clk=%b rst=%b S=%b R=%b Q=%b Qbar=%b  $time=%0t",clk,rst,S,R,Q,Qbar,$time);
endmodule

