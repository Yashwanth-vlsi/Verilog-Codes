module nor_gate_tb();
	reg a,b;
	wire y;
	nor_gate GATE(
	a,b,y);
initial begin
	a=0; b=0; #10;
	a=0; b=1; #10;
	a=1; b=0; #10;
	a=1; b=1; #10; 
end
initial
$monitor("a=%b b=%b y=%b time=%t",a,b,y,$time);
endmodule


