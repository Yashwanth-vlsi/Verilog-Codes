module siso(
    input clk,rst,
    input  se_in,
    output reg se_out);

reg [3:0]temp;

always @(posedge clk or negedge rst) 
    begin
    if(!rst)
        begin
        temp<=0;
        se_out<=0;
        end
        else
            begin
            se_out<=temp[0];
            temp[0]<=temp[1];
            temp[1]<=temp[2];
            temp[2]<=temp[3];

            temp[3]<=se_in;
            temp[2]<=temp[3];
            temp[1]<=temp[2];
            temp[0]<=temp[1];
           
          /*  assign se_out=temp;       
            temp<= {se_in, temp[3:1]}; 
            */
            end


    end
    endmodule

    //testbench code

module siso_tb();
    reg clk,rst,se_in;
    wire se_out;

    siso SISO(clk,rst,se_in,se_out);

    initial
    clk=0;
    always #10 clk=~clk;

    initial
    rst=0;
    always #10 rst=1;

    initial 
    begin
#10;
    se_in=1'b1; #20;
    se_in=1'b0; #20;
    se_in=1'b1; #20;
    se_in=1'b0; #20;
    

    #200; $stop;
    end
initial
    $monitor("clk=%d rst=%d se_in=%d se_out=%d $time=%0t",clk,rst,se_in,se_out,$time);
endmodule
