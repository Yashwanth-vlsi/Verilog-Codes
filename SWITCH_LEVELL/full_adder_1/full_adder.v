`include"or_gate.v"
`include"exor_gate.v"
`include"and_gate.v"
`include"half_adder_1.v"
module full_adder(a,b,c,sum,carry);
//directions
       input a,b,c;
       output sum,carry;
       wire w1,w2,w3;
//instansation
    half_adder_1 ha1(
    .a(a),
    .b(b),
    .sum(w1),
    .carry(w2)
    );
    half_adder_1 ha2(
    .a(w1),
    .b(c),
    .sum(sum),
    .carry(w3)
    );
    or_gate or1(
    .a(w2),
    .b(w3),
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
        .sum(tb_sum),
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
          $monitor("tb_a=%b tb_b=%b tb_c=%b tb_sum=%b tb_carry=%b time=%t",tb_a,tb_b,tb_c,tb_sum,tb_carry,$time);
          endmodule


           

