module comperator_2(a,b,g,l,e);
    input [1:0]a,b;
    output g,l,e;
    assign g = (a[1]&~b[1])|((a[1]~^b[1])&(a[0]&~b[0]));
    assign l = (~a[1]&b[1])|((a[1]~^b[1])&(~a[0]&b[0]));
    assign e = (a[1]~^b[1])&(a[0]~^b[0]);
 endmodule

//testbench code
  module comperator_2_tb();
    reg [1:0]a,b;
    wire g,l,e;
    comperator_2 CM(a,b,g,l,e);
    initial
    repeat (8)
    begin
    a=$random; b=$random; #10;
    end
    initial
    $monitor("a=%b b=%b g=%b l=%b e=%b",a,b,g,l,e);
    endmodule

