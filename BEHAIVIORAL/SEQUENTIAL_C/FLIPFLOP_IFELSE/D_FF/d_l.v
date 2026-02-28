module d(input clk,rst, input d, output reg q, output qbar);

    assign qbar=~q;

    always @(clk or rst or d)
             begin
             if(rst==0)
             q<=0;
             else
              if(clk == 1)
                    begin
                      if(!d)
                          q<=d;
                          else
                              q<=d;
                       end
                   end
                
endmodule


// testbench_code


module d_tb();
    reg clk,rst;
    reg d;
    wire q;
    wire qbar;

d DL(clk,rst,d,q,qbar);

    initial clk=0;
    always #10 clk=~clk;

    initial
    begin
    rst=0;
    #10 rst=1;

    repeat(20)
    begin
    d=$random; #10;
    end
    end
    initial
    #100 $stop;

    initial
    $monitor("clk=%b rst=%b d=%b q=%b qbar=%b $time=%0t",clk,rst,d,q,qbar,$time);
    endmodule
