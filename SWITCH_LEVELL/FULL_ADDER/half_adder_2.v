module half_adder_2(a,b,sum2,carry2);
input a,b;
output sum2,carry2;
//directions
xor_gate XOR(
    .a(a),
    .b(b),
    .y(sum2)
);
and_gate AND(
    .a(a),
    .b(b),
    .y(carry2)
);
endmodule
