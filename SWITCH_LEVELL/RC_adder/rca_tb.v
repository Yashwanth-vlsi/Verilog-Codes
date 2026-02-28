`include "rc_adder.v"

module rca_tb();
    reg [3:0] tb_a,tb_b;
    reg tb_cin;

    wire [3:0] tb_sum;
    wire tb_carry;


    rc_adder RTL(
                    .a(tb_a),
                    .b(tb_b),
                    .cin(tb_cin),
                    .s(tb_sum),
                    .carry(tb_carry)
                );

    //Generating Stimulus
    initial begin
        repeat(10)
            begin
                tb_a=$random;   tb_b=$random;   tb_cin=$random; #10;
            end
    end
    initial
        $monitor("tb_a=[%d]  tb_b=[%d]  tb_cin=[%d]  tb_sum=[%d]  tb_carry=[%d]",tb_a,tb_b,tb_cin,tb_sum,tb_carry);


endmodule
