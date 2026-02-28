module comperator_1(a,b,g,l,e);
    input a,b;
    output g,l,e;
    assign g = a&~b;
    assign l = ~a&b;
    assign e = (~(a^b));
  endmodule

//testbench code
  module comperator_1_tb();
    reg a,b;
    wire g,l,e;
    comperator_1 CM(a,b,g,l,e);
    initial
    repeat (8)
    begin
    a=$random; b=$random; #10;
    end
    initial
    $monitor("a=%b b=%b g=%b l=%b e=%b",a,b,g,l,e);
    endmodule

