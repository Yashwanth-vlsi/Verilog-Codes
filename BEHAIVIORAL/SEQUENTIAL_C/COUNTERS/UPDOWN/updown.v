module upd(input clk,rst, input [1:0]mod, output integer count);

always @(posedge clk or negedge rst)
    begin
        if(!rst)
            count<=50;
            else
              begin
                if(mod==0)
                count<=count-1;
               else
                 count<=count+1;
               end
    end
endmodule

// testbench code

module upd_tb();
    reg clk,rst;
    reg [1:0]mod;
    wire integer count;

    upd UP(clk,rst,mod,count);

    initial
    clk=0;
    always #10 clk=~clk;

    initial
    begin
    rst=0;
   #10; rst=1;
   end

   initial 
   repeat (10)
   begin
   mod=1'b0; #10;
   end

     initial
    #1000 $stop;

    initial
    $monitor(" rst=%d mod=%d count=%d $time=%0t",rst,mod,count,$time);
    
endmodule
