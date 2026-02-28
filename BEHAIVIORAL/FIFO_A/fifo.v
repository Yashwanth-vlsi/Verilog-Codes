module fifo(
            input clk,rst,write,read,
            input [7:0]datain,
            output reg [7:0]dataout);

      reg[7:0]mem;

always @(posedge clk or negedge rst)
    begin
    if(!rst)
        begin
        dataout<=0;
        mem<=0;
        end
        else
            if(write==1 && read==0)
            mem<=datain;
            else
                if(write==0 && read==1)
                    dataout<=mem;
     end
       endmodule

// testbench code

/*

module fifo_tb();
    reg clk,rst;
    reg[7:0]datain;
    reg write;
    reg read;
    wire[7:0]dataout;

    reg finish;

    fifo FF(.*);

    initial
    clk=0;
    always #5 clk=~clk;

    initial
    begin
    rst=0;
    #15; rst=1;
    end

    task WRT();
    begin
    write=1;
    read=0;
    repeat(8)
    begin
         #1;  datain=$random; #10;
    end
    end
    endtask

     task RED();
    begin
    write=0;
    read=1;

    end
    endtask

    task WRT_RED();
    begin
    repeat(8)
    begin
    #1;
    write=1; 
    read=1;
        datain=$random;#10;

    end
   // finish=1;
    end
    endtask

    initial
    begin
    wait(rst==1);
   // WRT();
   //RED();
    WRT_RED();
    end

    initial
    begin
  //  wait(finish==1);
    #280; $stop;
    end
    initial
    $monitor("clk=%b rst=%b datain=%d dataout=%d write=%0d read=%0d  $time=%0t",clk,rst,datain,write,read,dataout,$time);
    endmodule
    */





