module upc(input clk,rst, output integer count);

always @(posedge clk or negedge rst)
    begin
        if(!rst)
            count<=0;
            else 
                count<=count+1;
    end
endmodule

// testbench code

module upc_tb();
    reg clk,rst;
    wire integer count;

    upc UP(clk,rst,count);

    initial
    clk=0;
    always #10 clk=~clk;

    initial 
    rst=0;
    always #10 rst=1;

     initial
    #1000 $stop;

    initial
    $monitor("clk=%d rst=%d count=%d $time=%0t",clk,rst,count,$time);
    
endmodule
