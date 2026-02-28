`include"full_adder.v"
module rc_adder(input [3:0] a,b,
                input cin,
                output [3:0] s,
                output carry
                );
    wire w0,w1,w2;
    full_adder ha1(
        .a(a[0]),
        .b(b[0]),
        .c(cin),
        .sum(s[0]),
        .carry(w0)
    );
     full_adder ha2(
        .a(a[1]),
        .b(b[1]),
        .c(w0),
        .sum(s[1]),
        .carry(w1)
    );
      full_adder ha3(
        .a(a[2]),
        .b(b[2]),
        .c(w1),
        .sum(s[2]),
        .carry(w2)
    );
       full_adder ha4(
        .a(a[3]),
        .b(b[3]),
        .c(w2),
        .sum(s[3]),
        .carry(carry)
    );
       endmodule


