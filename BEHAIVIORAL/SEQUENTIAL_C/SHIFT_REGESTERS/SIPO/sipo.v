module sipo(
    input clk,rst,
    input  se_in,
    input mod,
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
           if(mod==0)
               begin
            temp[3]<=se_in;
            temp[2]<=temp[3];
            temp[1]<=temp[2];
            temp[0]<=temp[1];
           // temp<={se_in,temp[3:1]};

            end
        else
            assign pa_out=temp;
            
     end
    endmodule

    //testbench code

module sipo_tb();
    reg clk,rst,se_in;
    reg mod;
    wire [3:0]pa_out;

    sipo SISO(clk,rst,se_in,mod,pa_out);

    initial
    clk=0;
    always #10 clk=~clk;

    initial
    rst=0;
    always #10 rst=1;

    initial 
    begin
   // wait(rst==1);
    #10;
    se_in=1;  #20;
    se_in=0;  #20;
    se_in=1;  #20;
    se_in=0;  #20;
    end
  
    initial begin
    mod=0;
    #80; mod=1;
    end

    initial begin
    #200; $stop;
    end
initial
    $monitor("clk=%0b rst=%b se_in=%b mod=%b pa_out=%b $time=%0t",clk,rst,se_in,mod,pa_out,$time);
endmodule
