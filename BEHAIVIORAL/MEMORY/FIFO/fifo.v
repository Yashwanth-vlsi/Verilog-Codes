module fifo(
            input clk,rst,write,read,
            input [7:0]datain,
            output reg [7:0]dataout,
            output empty,full);

    reg [3:0]wr_ptr;
    reg [3:0]re_ptr;
    reg[7:0]mem[7:0];
    integer i;

    assign empty=(wr_ptr==re_ptr);
    assign full= ({!wr_ptr[3],wr_ptr[2:0]}==re_ptr);


always @(posedge clk or negedge rst)
    begin
    if(!rst)
        begin
        dataout<=0;
        wr_ptr<=0;
        re_ptr<=0;
        for(i=0;i<=7;i=i+1)
            mem[i]<=0;
            end
      else
          if(write && !read && !full)
             begin
              mem[wr_ptr]<=datain;
              wr_ptr<=wr_ptr+1;
             end
      else
          if(!write && read && !empty)
             begin
             dataout<=mem[re_ptr];
              re_ptr<=re_ptr+1;
             end
      else
          if(write && read && !full )
              begin
              mem[wr_ptr]<=datain;
              wr_ptr<=wr_ptr+1;
              dataout=mem[re_ptr];
              re_ptr<=re_ptr+1;
             //  dataout=mem[re_ptr];

              end

    end
endmodule

// testbench code

module fifo_tb();
    reg clk,rst;
    reg[7:0]datain;
    reg write;
    reg read;
    wire[7:0]dataout;
    wire empty,full;

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
    $monitor("clk=%b rst=%b datain=%d dataout=%d write=%0d read=%0d  empty=%b full=%b $time=%0t",clk,rst,datain,write,read,dataout,empty,full,$time);
    endmodule





