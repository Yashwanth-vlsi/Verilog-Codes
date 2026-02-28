`include"full_adder.v"
module adder_sub(
    input [3:0]a,b,
    input m,cin,
    output [3:0]s,
    output cout,
    output [3:0]x);
    wire z0,z1,z2;

    xor G1(x[0],b[0],~m);
    xor G2(x[1],b[1],~m);
    xor G3(x[2],b[2],~m);
    xor G4(x[3],b[3],~m);

    full_adder F1(a[0],x[0],cin,s[0],z0);
    full_adder F2(a[1],x[1],z0,s[1],z1);
    full_adder F3(a[2],x[2],z1,s[2],z2);
    full_adder F4(a[3],x[3],z2,s[3],cout);
endmodule
    
    //testbench codde

module adder_sub_tb();
    reg [3:0]a,b;
    reg m,cin;
    wire [3:0]s;
    wire cout;
    wire [3:0]x;
    adder_sub AS(a,b,m,cin,s,cout,x);
    initial 
    repeat(4)
    begin
    a=$random; b=$random; m=0; cin=1; #10;
    a=$random; b=$random; m=1;cin=0; #10;
    end
    initial
    $monitor("a=%d b=%d m=%b cin=%b s=%d cout=%d $time=%0t",a,b,m,cin,s,cout,$time);
    endmodule
