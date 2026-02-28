module pipo(
    input clk,rst,
    input [3:0]pa_in,
    output reg [3:0]pa_out);

reg [3:0]temp;

always @(posedge clk or negedge rst) 
    begin
    if(!rst)
        begin
        temp<=0;
        pa_out<=0;
        end
        else
        pa_out<=temp;
        temp<=pa_in;     
     end
    endmodule

    //testbench code

module pipo_tb();
    reg clk,rst;
   reg[3:0]pa_in;
    wire [3:0]pa_out;

    pipo PISO(clk,rst,pa_in,pa_out);

    initial
    clk=0;
    always #10 clk=~clk;

    initial
    rst=0;
    always #10 rst=1;

    initial 
    begin
    #10;
    pa_in=4'b1010;  
    end
    initial begin
    #200; $stop;
    end
initial
    $monitor("clk=%0b rst=%b pa_in=%b  pa_out=%b $time=%0t",clk,rst,pa_in,pa_out,$time);
endmodule
