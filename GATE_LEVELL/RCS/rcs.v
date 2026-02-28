`include"full_adder.v"
module rcs(input [3:0]a,b, input bin, output [3:0]d, output bout);
    wire wo,w1,w2;
    full_adder F1(a[0],~b[0],bin,d[0],w0);
    full_adder F2(a[1],~b[1],w0,d[1],w1);
    full_adder F3(a[2],~b[2],w1,d[2],w2);
    full_adder F4(a[3],~b[3],w2,d[3],bout);
endmodule

    //testbench code
module rcs_tb();
    reg [3:0]a;
    reg [3:0]b;
    reg bin;
    wire [3:0]d;
    wire bout;
    rcs RCS(a,b,bin,d,bout);
    initial 
    repeat(10)
    begin
    a=$random; b=$random; bin=$random; #10;
    end
    initial 
    $monitor("a=%b    b=%b   bin=%b    d=%b   bout=%b   $time=%0t ",a,b,bin,d,bout,$time);
    endmodule




