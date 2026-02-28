module xnor_gate(input a,b, output y);
        wire w1,w2,w3;
        supply1 VDD;
        supply0 GND;

            pmos p1(w1,VDD,a);
            pmos p2(w1,VDD,~b);
            pmos p3(y,w1,~a);
            pmos p4(y,w1,b);

            nmos n1(y,w2,a);
            nmos n2(w2,GND,~b);
            nmos n3(y,w3,~a);
            nmos n4(w3,GND,b);
endmodule
