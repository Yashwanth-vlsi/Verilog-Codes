module ram1(
            input clk,rst,wr_re,
            input [7:0]datain,
            input [4:0]addr,
            output reg [7:0]dataout,
            output reg empty,full
            );

    reg [7:0]mem[31:0];
    integer i;
    reg [5:0]count;

always@(posedge clk or negedge rst)
    begin
    if(!rst)
        begin
        dataout<=0;
         empty<=1;
            full<=0;
            count<=0;
        for(i=0;i<32;i=i+1)
            mem[i]<=0;           
            end
            else
              //  begin
                if(wr_re)
                    begin
                    mem[addr]<=datain;
                     if(count<32)
                     count<=count+1;
                    
                    end
                 else
                    begin
                    dataout<=mem[addr];
                   if (count>0)
                    count<=count-1;
                     //count<=count-1'b1;
                 end
                 empty<=(count==0);
                 full<=(count==32);
   // end
    end
endmodule

// testbench code

module ram1_tb();
    reg clk,rst,wr_re;
    reg [7:0]datain;
    reg [4:0]addr;
    wire [7:0]dataout;
    wire empty,full;

    reg finish;
    integer i;

    ram1 RM(.*);

    initial
    clk=0;
    always #5 clk=~clk;

    initial
    begin
    rst=0;
    #20; rst=1;
    end
    
     task write();
    // repeat(32)
        begin
        wr_re=1;
        for(i=0;i<32;i=i+1)
            begin
           // wait(rst==1);
            addr=i;
            datain=$random;
            #10;

            end
        end
     endtask

     task read();
        begin
        wr_re=0;
       // for(i=0;i<32;i=i+1)
           // begin
            addr=2; #10;
            addr=2; #10;
            addr=2; #10;
            addr=2; #10;
            addr=2; #10;
            addr=2; #10;
            addr=2; #10;
            addr=2; #10;
            addr=2; #10;
            addr=2; #10;
            addr=2; #10;
            addr=2; #10;
            addr=2; #10;
            addr=2; #10;
            addr=2; #10;
            addr=2; #10;
            addr=2; #10;
            addr=2; #10;
            addr=2; #10;
            addr=2; #10;
            addr=2; #10;
            addr=2; #10;
            addr=2; #10;
            addr=2; #10;
            addr=2; #10;
            addr=2; #10;
            addr=2; #10;
            addr=2; #10;
            addr=2; #10;
            addr=2; #10;
            addr=2; #10;
            addr=2; #10;
            //end
            finish=1;
        end
     endtask

        
    initial 
    begin
    wait(rst==1);
    write();
    read();
        end

    initial
    begin
    //wait(finish==1);
    #670 $stop;
    end

    initial
    $monitor("clk=%b rst=%b wr_re=%b data_in=%d addr=%b data_out=%d empty=%b full=%b time=%0t",clk,rst,wr_re,datain,addr,dataout,empty,full,$time);


   endmodule


