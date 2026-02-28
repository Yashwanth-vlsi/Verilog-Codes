module sisor(
    input clk,rst,mod,
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
            if(mod==0)
            begin
            se_out<=temp[0];
            temp[0]<=temp[1];
            temp[1]<=temp[2];
            temp[2]<=temp[3];

            temp[3]<=se_in;
          /*  temp[2]<=temp[3];
            temp[1]<=temp[2];
            temp[0]<=temp[1];
           
          /*  assign se_out=temp;       
            temp<= {se_in, temp[3:1]}; 
            */
            end
            else
                begin
            se_out<=temp[3];
            temp[3]<=temp[2];
            temp[2]<=temp[1];
            temp[1]<=temp[0];

            temp[0]<=se_in;
           /* temp[1]<=temp[0];
            temp[2]<=temp[1];
            temp[3]<=temp[2];
            */
                end


    end
    endmodule

    //testbench code

module sisor_tb();
    reg clk,rst,mod,se_in;
    wire se_out;

    sisor SISOR(clk,rst,mod,se_in,se_out);

    initial
    clk=0;
    always #10 clk=~clk;

    initial
    rst=0;
    always #10 rst=1;

    initial 
    begin
    mod=0;
    se_in=1'b1; mod=0; #20;
    se_in=1'b0; mod=0;#20;
    se_in=1'b1; mod=0; #20;
    se_in=1'b1;mod=0; #20;

    #100;
    
    mod=1;
    se_in=1'b1;  #20;
    se_in=1'b0; #20;
    se_in=1'b1;  #20;
    se_in=1'b0; #20;
end
initial
begin
    #500; $stop;
    end
initial
    $monitor("clk=%d rst=%d mod=%b se_in=%d se_out=%d $time=%0t",clk,rst,mod,se_in,se_out,$time);
endmodule
