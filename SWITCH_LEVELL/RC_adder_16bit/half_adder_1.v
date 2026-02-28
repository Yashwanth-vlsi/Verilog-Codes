module half_adder_1(a,b,sum,carry);
    input a,b;
    output sum,carry;
    //directions
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

