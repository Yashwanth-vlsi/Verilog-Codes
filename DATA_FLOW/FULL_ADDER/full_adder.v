module full_adder(a,b,cin,sum,carry);
    input a,b,cin;
    output sum,carry;
    assign sum = (a^b^cin);
    assign carry = (a&b)|cin&(a^b);
    endmodule

    // testbench code

    module full_adder_tb();
        reg a,b,cin;
        wire sum,carry;

        full_adder FA(a,b,cin,sum,carry);
        initial 
        repeat (8)
        begin
        a=$random; b=$random; cin=$random; #10;
        end
        initial
        $monitor("a=%b b=%b cin=%b sum=%b carry=%b",a,b,cin,sum,carry);
        endmodule

