module dnc(input clk,rst, output integer count);

always @(posedge clk or negedge rst)
    begin
        if(!rst)
            count<=15;
            else 
                count<=count-1;
                
                if(count==0)
                    count<=15;
    end
endmodule

// testbench code

module dnc_tb();
    reg clk,rst;
    wire integer count;

    dnc UP(clk,rst,count);

    initial
    clk=0;
    always #10 clk=~clk;

    initial
    begin
    rst=0;
   #10; rst=1;
   end

     initial
    #1000 $stop;

    initial
    $monitor(" rst=%d count=%d $time=%0t",rst,count,$time);
    
endmodule
