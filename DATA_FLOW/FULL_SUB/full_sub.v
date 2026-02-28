module full_sub(a,b,bin,dif,bar);
    input a,b,bin;
    output dif,bar;
    assign dif = a^b^bin;
    assign bar = ~a&b|b&bin|~a&bin;
    endmodule

    // testbench code

    module full_sub_tb();
        reg a,b,bin;
        wire dif,bar;

        full_sub HA(a,b,bin,dif,bar);
        initial 
        repeat (8)
        begin
        a=$random; b=$random; bin=$random; #10;
        end
        initial
        $monitor("a=%b b=%b bin=%b dif=%b bar=%b",a,b,bin,dif,bar);
        endmodule

