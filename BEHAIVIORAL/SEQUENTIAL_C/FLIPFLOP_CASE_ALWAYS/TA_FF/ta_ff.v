module ta_ff(input clk,rst,t, output reg q, output qbar);
    assign qbar=~q;

    always @(negedge clk)
    begin
    if(!rst)
        q=0;
        else
            begin
                case(t)
                    1'b0  :  q<=q;
                    default
                    :q<=~q;
                endcase
            end
     end
 endmodule

 //testbench code

 module ta_ff_tb();
 reg clk,rst,t;
 wire q,qbar;

 ta_ff TA(clk,rst,t,q,qbar);

 initial clk=1;
 always #10 clk=~clk;

 initial
   begin
     rst=0;
     #12 rst=1;

     repeat(200)
     begin
     t=$random; #3;
     end
   end
   initial 
   #200 $stop;

   initial
   $monitor("clk=%b rst=%b t=%b q=%b qbar=%b $time=%0t",clk,rst,t,q,qbar,$time);
   endmodule

