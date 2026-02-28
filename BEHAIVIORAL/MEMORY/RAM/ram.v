module ram(
            input clk,rst,wr_re,
            input [7:0]data_in,
            input [4:0]addr,
            output reg [7:0]data_out
            );

integer i;
reg [7:0] mem [31:0];

always @ (posedge clk or negedge rst)
    begin
        if(!rst)
            begin
            data_out<=0;
            for(i=0;i<=31;i=i+1)
                mem[i]=0;
            end
            else
                begin
                if(wr_re)
                    mem[addr]=data_in;
                    else
                        data_out=mem[addr];
                end
    end
endmodule

// testbench_code

module ram_tb();
    reg clk,rst,wr_re;
    reg [7:0]data_in;
    reg [4:0]addr;
    wire [7:0]data_out;

    reg finish;

    integer i;
    
    ram RM(.*);

    task WRITE();
        begin
        wr_re=1;
        for(i=0;i<=31;i=i+1)
            begin
            wait(rst==1);
            addr=i;
            data_in=$random;
            #20;
            end
        end
     endtask

     task READ();
        begin
        wr_re=0;
        for(i=0;i<=31;i=i+1)
            begin
            addr=i;
            #20;
            end
            finish=1;
        end
     endtask

     
    initial 
    begin
    wait(rst==1);
    WRITE();
    READ();
    end

    initial
    clk=0;
    always #10 clk=~clk;

    initial
    begin
    rst=0; #10;
    rst=1;
    end

     initial
    begin
    wait(finish==1);
    $stop;
    end

initial
    $monitor("clk=%b rst=%b wr_re=%b data_in=%d addr=%b data_out=%d $time=%0t",clk,rst,wr_re,data_in,addr,data_out,$time);


   endmodule









