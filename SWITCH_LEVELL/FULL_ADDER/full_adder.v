module full_adder(a,b,c,sum2,carry);
//directions
       input a,b,c;
       output sum2,carry;
//instansation
    half_adder ha1(
    .a(a),
    .b(b),
    .sum1(sum1),
    .carry1(carry1)
    );
    half_adder ha2(
    .a(sum1),
    .b(c),
    .sum2(sum2),
    .carry2(carry2)
    );
    or_gate or1(
    .a(carry1),
    .b(carry2),
    .y(carry)
    );
endmodule

//testbench code
module full_adder_tb();
    reg tb_a,tb_b,tb_c;
    wire tb_sum,tb_carry;
    //instantation
    full_adder FA(
        .a(tb_a),
        .b(tb_b),
        .c(tb_c),
        .sum2(tb_sum2),
        .carry(tb_carry)

    );

        initial begin
            tb_a=0; tb_b=0; tb_c=0; #10;
            tb_a=0; tb_b=0; tb_c=1; #10;
            tb_a=0; tb_b=1; tb_c=0; #10;
            tb_a=0; tb_b=1; tb_c=1; #10;
            tb_a=1; tb_b=0; tb_c=0; #10;
            tb_a=1; tb_b=0; tb_c=1; #10;
            tb_a=1; tb_b=1; tb_c=0; #10;
            tb_a=1; tb_b=1; tb_c=1; #10;
          end
          initial
          $monitor("tb_a=%b tb_b=%b tb_c=%b tb_sum2=%b tb_carry=%b time=%t",tb_a,tb_b,tb_c,tb_sum2,tb_carry,$time);
          endmodule
            

