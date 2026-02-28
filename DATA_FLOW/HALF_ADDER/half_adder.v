module half_adder(a,b,sum,carry);
    input a,b;
    output sum,carry;
    assign sum = a^b;
    assign carry = a&b;
    endmodule

    // testbench code

    module half_adder_tb();
        reg a,b;
        wire sum,carry;

        half_adder HA(a,b,sum,carry);
        initial 
        repeat (8)
        begin
        a=$random; b=$random; #10;
        end
        initial
        $monitor("a=%b b=%b sum=%b carry=%b",a,b,sum,carry);
        endmodule


