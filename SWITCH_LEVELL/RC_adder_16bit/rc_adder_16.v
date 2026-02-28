`include"rc_adder.v"
module rc_adder_16(
    input[15:0]a,b,
    input cin,
    output[15:0]s,
    output carry
    );
wire[2:0]c;
rc_adder RC1(
        .a(a[3:0]),
        .b(b[3:0]),
        .cin(cin),
        .s(s[3:0]),
        .carry(c[0])
);
rc_adder RC2(
        .a(a[7:4]),
        .b(b[7:4]),
        .cin(c[0]),
        .s(s[7:4]),
        .carry(c[1])
);
rc_adder RC3(
        .a(a[11:8]),
        .b(b[11:8]),
        .cin(c[1]),
        .s(s[11:8]),
        .carry(c[2])
);
rc_adder RC4(
        .a(a[15:12]),
        .b(b[15:12]),
        .cin(c[2]),
        .s(s[15:12]),
        .carry(carry)
);
endmodule

//test bench code
module rc_adder_16_tb();
reg [15:0] tb_a,tb_b;
reg tb_cin;
wire [15:0] tb_s;
wire tb_carry;

rc_adder_16 RC(
        .a(tb_a),
        .b(tb_b),
        .cin(tb_cin),
        .s(tb_s),
        .carry(tb_carry)
         );

initial begin
    tb_a=134; tb_b=34; tb_cin=1; #10;
    end
    initial
        $monitor("tb_a=%0d   tb_b=%0d tb_cin=%0d   tb_s=%0d tb_carry=%0d",tb_a,tb_b,tb_cin,tb_s,tb_carry);
     endmodule

