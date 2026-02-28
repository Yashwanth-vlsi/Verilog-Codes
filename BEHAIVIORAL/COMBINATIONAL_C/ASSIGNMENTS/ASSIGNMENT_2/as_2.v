module rca();
    reg [3:0]a,b;
    reg CIN;
    reg carry;
    reg [1:0]rslt;
    reg c;
    reg [3:0]sum;

function reg[1:0] f1(input a,b,cin);
    reg sum,carry;
    begin
   carry=(a&b)|(b&cin)|(a&cin);
   sum=a^b^cin;
    f1={carry,sum};
    end
endfunction

 initial
 begin
     a=4'b0011;
     b=4'b1100; 
     CIN=1'b1;

rslt=f1(a[0],b[0],CIN);
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

     $display("a=%b b=%b CIN=%b sum=%b carry=%b",a,b,CIN,sum,carry);
end
endmodule
