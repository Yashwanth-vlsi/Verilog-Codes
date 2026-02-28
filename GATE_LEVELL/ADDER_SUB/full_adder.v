module full_adder(input a,b,cin, output sum,carry);
    wire w1,w2,w3;
    xor G1(w1,a,b);
    and G2(w2,a,b);
    xor G3(sum,w1,cin);
    and G4(w3,w1,cin);
    or G5(carry,w3,w2);
    endmodule

    module full_adder_tb();
    reg tb_a,tb_b,tb_cin;
    wire tb_sum,tb_carry;

    full_adder FA(
                tb_a,tb_b,tb_cin,tb_sum,tb_carry
                );
    initial begin
    repeat (8)
    begin
    tb_a=$random; tb_b=$random;tb_cin=$random; #10;
    end
    end

    initial
    $monitor("tb_a=%0b  tb_b=%0b  tb_cin=%0b tb_sum=%0b  tb_carry=%0b $time=%0t",tb_a,tb_b,tb_cin,tb_sum,tb_carry,$time);
    endmodule
