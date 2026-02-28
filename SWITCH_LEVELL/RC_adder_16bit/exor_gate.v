module xor_gate(a,b,y);
    //DIRECTIONS
    input a,b;
    output y;

        //INTERNAL SIGNALS
            wire w1,w2,w3,w4;
            supply1 VDD;
            supply0 GND;
            //INSTANTSIATION
                pmos p1(w1,VDD,~a);
                pmos p2(w1,VDD,b);
                pmos p3(w2,w1,a);
                pmos p4(w2,w1,~b);
                pmos p5(y,VDD,w2);

                nmos n1(w2,w3,a);
                nmos n2(w2,w4,~a);
                nmos n3(w3,GND,~b);
                nmos n4(w4,GND,b);
                nmos n5(y,GND,w2);
endmodule

