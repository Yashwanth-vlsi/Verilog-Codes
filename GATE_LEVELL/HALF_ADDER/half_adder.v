module half_adder(a,b,sum,carry);
    input a,b;
    output sum,carry;
    
    xor G1(sum,a,b);
    and G2(carry,a,b);
    endmodule

    module half_adder_tb();
            reg tb_a,tb_b;
            wire tb_sum,tb_carry;

    half_adder HA(
        tb_a,tb_b,tb_sum,tb_carry
        );
    initial begin
    repeat(4)
    begin
    tb_a=$random; tb_b=$random; #10;
    end
    end
    initial
    $monitor("tb_a=%0b  tb_b=%0b  tb_sum=%0b  tb_carry=%0b $time=%0t",tb_a,tb_b,tb_sum,tb_carry,$time);
    endmodule
