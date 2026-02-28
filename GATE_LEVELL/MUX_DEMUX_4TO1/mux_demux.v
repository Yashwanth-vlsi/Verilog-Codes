`include"mux1.v"
`include"demux.v"
module mux_demux(a,s,g);
input [3:0]a;
input [1:0]s;
output [3:0]g;
//wire w;
mux_4to1 MUX4to1(.a(a),
                 .s(s),
                 .y(y)
               );
demux_1to4 demux1to4(
                    .y(y),
                    .s(s),
                    .a(g)

);
endmodule

//testbench

module mux_demux_tb();
reg [3:0]tb_a;
reg [1:0]tb_s;
wire [3:0]tb_g;
//integer x;
 mux_demux MD(
                .a(tb_a),
                .s(tb_s),
                .g(tb_g)

 );

initial 
repeat(10)
begin
    tb_a=$random;  tb_s=$random; #10;
   /* for(x=0;x<4;x=x+1)
        begin
        tb_s=x;#10;
        end
  */

end 
initial
$monitor("tb_a=%b    tb_s=%b    tb_g=%b     $time=%0t",tb_a,tb_s,tb_g,$time);
endmodule

