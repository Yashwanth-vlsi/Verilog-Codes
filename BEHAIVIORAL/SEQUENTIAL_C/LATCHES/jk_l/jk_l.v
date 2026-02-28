module jk(input clk,rst, input j,k, output reg q, output qbar);
    
    assign qbar=~q;

    always @(clk or rst)
    begin 
    if(rst==0)
        q<=0;
        else
            begin
            if(clk==1)
                begin
                    if(j==0 && k==0)
                        q<=q;
                        else 
                            if(j==0 && k==1)
                            q<=0;
                            else
                                if(j==1 && k==0)
                                    q<=1;
                                    else
                                        q<=~q;
                   end
              end
      end
      endmodule



      // testbench_code

module jk_tb();
    reg clk,rst;
    reg j,k;
    wire q;
    wire qbar;



jk JK(clk,rst,j,k,q,qbar);

    initial clk =0;
    always #10 clk =~clk;

    initial
    begin
    rst=0;
    #10;
    rst=1;
    
    repeat(25)
    begin
    j=$random; k=$random; #10;
    end
    end
    
    initial
    #100 $stop;

    initial
    $monitor("clk=%b rst=%b j=%b k=%b q=%b qbar=%b $time=%0t",clk,rst,j,k,q,qbar,$time);
    endmodule

