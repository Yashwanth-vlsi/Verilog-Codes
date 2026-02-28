module sra_ff(input clk,rst,s,r, output reg q, output qbar);
    assign qbar=~q;

    always @(posedge clk)
    begin
    if(!rst)
        q=0;
        else
            begin
                case({s,r})
                    2'b00  :  q<=q;
                    2'b01  :  q<=0;
                    2'b10  :  q<=1;
                    2'b11  :  q<=1'bx;
                endcase
            end
     end
 endmodule

 //testbench code

 module sra_ff_tb();
 reg clk,rst,s,r;
 wire q,qbar;

 sra_ff SRA(clk,rst,s,r,q,qbar);

 initial clk=0;
 always #10 clk=~clk;

 initial
   begin
     rst=0;
     #10 rst=1;

     repeat(200)
     begin
     {s,r}=$random; #3;
     end
   end
   initial 
   #200 $stop;

   initial
   $monitor("clk=%b rst=%b s=%b r=%b q=%b qbar=%b $time=%0t",clk,rst,s,r,q,qbar,$time);
   endmodule


