module half_adder(input a,b, output sum,carry);
    xor_gate XOR(
        .a(a),
        .b(b),
        .y(sum)
        );
    and_gate AND(
        .a(a),
        .b(b),
        .y(carry)
        );
    
endmodule


module half_adder_tb();
    reg tb_a,tb_b;
    wire tb_sum,tb_carry;

    half_adder HA(
        .a(tb_a),
        .b(tb_b),
        .sum(tb_sum),
        .carry(tb_carry)
        );
    initial begin
    tb_a=0; tb_b=0; #10;
	tb_a=0; tb_b=1; #10;
	tb_a=1; tb_b=0; #10;
	tb_a=1; tb_b=1; #10;
end
initial
$monitor("tb_a=%b tb_b=%d tb_sum=%o tb_carry=%h ",tb_a,tb_b,tb_sum,tb_carry);
endmodule
    
