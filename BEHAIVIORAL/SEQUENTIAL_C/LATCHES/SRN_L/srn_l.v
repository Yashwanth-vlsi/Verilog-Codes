module sr(clk,rst,s,r,q,qbar);
    input clk,rst;
    input s,r;
    output reg q;
    output qbar;

    
    assign qbar=~q;

//always #5 clk=~clk


/* always begin
    clk=0; #5;
    clk=1; #5;
end*/

/*initial clk=0;
always begin
    clk=~clk; #5;
    end*/

always @(clk or rst)
    begin
        if(!rst)
            q<=0;
                else
                    begin
                    if(clk==0)
                        begin
                            if(s==0 && r==0)
                                q<=q;
                            else if (s==0 && r==1)
                                q<=0;
                                else if (s==1 && r==0)
                                    q<=1;
                                    else
                                        q<=1'bx;
                          end
                       end
   end
endmodule


// testbench_code


module sr_l_tb();
    reg clk,rst;
    reg s,r;
    wire q,qbar;

    
    sr SR(clk,rst,s,r,q,qbar);

   initial
    begin
    clk=0;
    end
    always #5 clk =~clk;
    initial 
    begin
    rst=0; #10; 
    rst=1;
    end

    initial
    repeat(10)
    begin
    s=$random; r=$random; #10;
    end
    initial
    #100 $stop;

    initial
    $monitor("clk=%b rst=%b s=%b r=%b q=%b qbar=%b $time=%0t",clk,rst,s,r,q,qbar,$time);

    endmodule
