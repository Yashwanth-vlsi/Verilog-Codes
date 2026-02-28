module and_gate(a,b,y);
//directions
	input a,b;
	output y;
//internal signals
	wire w1;
	wire w2;
	supply1 vdd;
	supply0 gnd;
	pmos p1(w1,vdd,a);
	pmos p2(w1,vdd,b);
	pmos p3(y,vdd,w1);
	nmos n1(w2,gnd,a);
	nmos n2(w1,w2,b);
	nmos n3(y,gnd,w1);
endmodule
