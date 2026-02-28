`include"fifo.v"
`include"piso.v"
`include"sipo.v"
module rxtx(input clk,rst,write,read,mod, input [7:0]datain, output [7:0]dataout);

wire[7:0]w1;
wire w2;
wire[7:0]w3;

fifo F1(clk,rst,write,read,datain,w1);
piso P1(clk,rst,mod,w1,w2);
sipo S1(clk,rst,w2,mod,w3);
fifo F2(clk,rst,write,read,w3,dataout);

endmodule

// testbench code

module rxtx_tb();
    reg clk,rst,write,read,mod;
    reg [7:0]datain;
    wire [7:0]dataout;

    rxtx R2(.*);

    initial 
    clk=0;
    always #5 clk=~clk;

    initial
    begin
    rst=0; #20;
    rst=1;
    end

    initial
    begin
    datain=0;
    wait(rst);
   // datain=18;
    write=1; read=0;#20;
    datain=18;#10;
    write=0; read=1;#20;
    mod=1; #20;
    mod=0; #40;
    mod=1; #50;
   // mod=0; #20;
    write=1; read=0;#20;
    write=0; read=1;#20;
    end

    initial
    #500 $stop;

    initial 
    $monitor("clk=%b rst=%b write=%b read=%b mod=%b datain=%d dataout=%d $time=%0t",clk,rst,write,read,mod,datain,dataout,$time);
    endmodule
