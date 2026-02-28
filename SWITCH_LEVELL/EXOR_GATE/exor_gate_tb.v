module exor_gate_tb();
	reg tb_a,tb_b;
	wire tb_y;
//instansation
	exor_gate gate(
	tb_a,tb_b,tb_y);
initial begin
	tb_a=0; tb_b=0; #10;
	tb_a=0; tb_b=1; #10;
	tb_a=1; tb_b=0; #10;
	tb_a=1; tb_b=1; #10;
end
initial
	$monitor("tb_a=%b tb_b=%b tb_y=%b time=%t",tb_a,tb_b,tb_y,$time);
endmodule