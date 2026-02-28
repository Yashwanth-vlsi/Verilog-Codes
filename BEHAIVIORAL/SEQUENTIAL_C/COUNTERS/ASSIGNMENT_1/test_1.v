module test( input clk,rst, output integer count);

    always @(posedge clk or negedge rst)
    begin
        if(!rst)
            count<=18;

            else
                count<=count+1;
                 
                 if(count==27)
                     count<=18;
    end
    endmodule


//

    module test_tb();
        reg clk,rst;
        wire integer count;

        test T1(clk,rst,count);

        initial
        clk=1;
        always #10 clk=~clk;

        initial
        begin
        rst=0;
        #10 rst=1;
        end

        initial 
        begin
         #300; $stop;
        end

        initial
        $monitor("clk=%b rst=%b count=%d $time=%0t",clk,rst,count,$time);
        endmodule


