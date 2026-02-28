module da_ff(input clk,rst,d, output reg q, output qbar);
    assign qbar=~q;

    always @(posedge clk)
    begin
    if(!rst)
        q=0;
        else
            begin
                case(d)
                    1'b0  :  q<=d;
                    default
                    :q<=d;
                endcase
            end
     end
 endmodule

 //testbench code

 module da_ff_tb();
 reg clk,rst,d;
 wire q,qbar;

 da_ff DA(clk,rst,d,q,qbar);

 initial clk=1;
 always #10 clk=~clk;

 initial
   begin
     rst=0;
     #10 rst=1;

     repeat(200)
     begin
     d=$random; #3;
     end
   end
   initial 
   #200 $stop;

   initial
   $monitor("clk=%b rst=%b d=%b q=%b qbar=%b $time=%0t",clk,rst,d,q,qbar,$time);
   endmodule

