module half_sub(a,b,dif,bar);
    input a,b;
    output dif,bar;
    assign dif = a^b;
    assign bar = ~a&b;
    endmodule

    // testbench code

    module half_sub_tb();
        reg a,b;
        wire dif,bar;

        half_sub HA(a,b,dif,bar);
        initial 
        repeat (8)
        begin
        a=$random; b=$random; #10;
        end
        initial
        $monitor("a=%b b=%b dif=%b bar=%b",a,b,dif,bar);
        endmodule

