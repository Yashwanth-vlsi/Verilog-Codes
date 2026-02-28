
module nand_gate(a,b,y);

//DIrections

	input a;
	input b;
	output y;

//INTERNAL SIGNALS 
	wire w;
	supply1 VDD;
	supply0 GND;
	pmos p1(y,VDD,a);
	pmos p2(y, VDD,b);
	nmos n1(y,w,b); nmos n2(w, GND, a);

endmodule
