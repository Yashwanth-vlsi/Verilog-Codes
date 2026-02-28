module piso(
    input clk,rst,
    input mod,
    input [3:0]pa_in,
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
            if(mod==0)
                begin
                     temp<=pa_in;     
                 end
                 else 
                     begin
                     se_out<=temp[0];
                     temp[0]<=temp[1];
                     temp[1]<=temp[2];
                     temp[2]<=temp[3];
                     end
      end
    endmodule

    //testbench code

module piso_tb();
    reg clk,rst;
    reg mod;
   reg[3:0]pa_in;
    wire se_out;

    piso PISO(clk,rst,mod,pa_in,se_out);

    initial
    clk=0;
    always #10 clk=~clk;

    initial
    rst=0;
    always #10 rst=1;

    initial 
    begin
    pa_in=4'b1010;  
    end

    initial 
    begin
    mod=0;
    #30; mod=1;
    end

    initial begin
    #200; $stop;
    end
initial
    $monitor("clk=%b rst=%b mod=%b pa_in=%b  se_out=%b $time=%0t",clk,rst,mod,pa_in,se_out,$time);
endmodule
