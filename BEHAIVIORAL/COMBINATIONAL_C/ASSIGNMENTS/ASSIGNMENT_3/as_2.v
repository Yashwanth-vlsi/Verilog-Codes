module rca(a,b,cin,sum,carry);
    input [3:0]a,b;
    input cin;
    reg [1:0]rslt;
    reg c;

   // output carry;
   // reg [1:0]rslt;
   // reg c;
    output reg [3:0]sum;
     output reg carry;

function reg[1:0] f1(input a,b,cin);
    reg sum,carry;
    begin
   carry=(a&b)|(b&cin)|(a&cin);
   sum=a^b^cin;
    f1={carry,sum};
    end
endfunction

 always@(*)
 begin
rslt=f1(a[0],b[0],cin);
    sum[0]=rslt[0];
    c=rslt[1];

rslt=f1(a[1],b[1],c);
    sum[1]=rslt[0];
     c=rslt[1];

rslt=f1(a[2],b[2],c);
    sum[2]=rslt[0];
     c=rslt[1];

rslt=f1(a[3],b[3],c);
    sum[3]=rslt[0];
     carry=rslt[1];

    // $display("a=%b b=%b cin=%b sum=%b carry=%b",a,b,cin,sum,carry);
end
endmodule

//testbench code


module rca_tb();
reg [3:0]a,b;
reg cin;
wire [3:0]sum;
wire  carry;

rca RC(a,b,cin,sum,carry);

initial 
begin
a=$random; b=$random; cin=$random;
end

initial
$monitor("a=%b b=%b cin=%b sum=%b carry=%b $time=%0t",a,b,cin,sum,carry,$time);
endmodule
