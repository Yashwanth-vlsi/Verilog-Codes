`include"as_2.v"
`include"as_3.v"
module top();
reg[3:0]a,b;
reg cin;
wire[3:0]sum;
wire carry;

reg[3:0]da,db;
reg dcin;
wire [3:0]ds;
wire dcarry;

    rca RC(a,b,cin,sum,carry);

    as3 F12(da,db,dcin,ds,dcarry);
initial
begin
    a=4'b0010; b=4'b1010; cin=1'b1; 
    da=4'b0010; db=4'b1010; dcin=1'b1;

#20
$monitor("a=%b b=%b cin=%b sum=%b carry=%b ",a,b,cin,sum,carry);
#20

$monitor("da=%b db=%b dcin=%b ds=%b dcarry=%b ",da,db,dcin,ds,dcarry);
    #20;
if(sum==ds && carry==dcarry)
    $display("matched");
    else
        $display("notmatched");
end
endmodule



