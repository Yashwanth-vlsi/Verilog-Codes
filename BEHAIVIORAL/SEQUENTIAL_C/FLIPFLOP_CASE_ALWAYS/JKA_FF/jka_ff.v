module jka_ff(input clk,rst,j,k, output reg q, output qbar);
    assign qbar=~q;

    always @(posedge clk)
    begin
    if(!rst)
        q=0;
        else
            begin
                case({j,k})
                    2'b00  :  q<=q;
                    2'b01  :  q<=0;
                    2'b10  :  q<=1;
                    2'b11  :  q<=~q;
                endcase
            end
     end
 endmodule

 //testbench code

 module jka_ff_tb();
 reg clk,rst,j,k;
 wire q,qbar;

 jka_ff JKA(clk,rst,j,k,q,qbar);

 initial clk=1;
 always #10 clk=~clk;

 initial
   begin
     rst=0;
     #10 rst=1;

     repeat(200)
     begin
     {j,k}=$random; #3;
     end
   end
   initial 
   #200 $stop;

   initial
   $monitor("clk=%b rst=%b j=%b k=%b q=%b qbar=%b $time=%0t",clk,rst,j,k,q,qbar,$time);
   endmodule



