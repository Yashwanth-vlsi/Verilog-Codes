module even_paraty_g(a,b,c,epg);
    input a,b,c;
    output epg;
    assign epg = a^b^c;
endmodule

//tb code

module even_paraty_g_tb(epg,a,b,c);
    input wire epg;
    output reg a,b,c;
    initial
    repeat (8)
    begin
    a=$random; b=$random; c=$random; #10;
    end
    initial
    $monitor("a=%b b=%b c=%b epg=%b ",a,b,c,epg);
    endmodule

    // top code

 module top();
    wire w_a,w_b,w_c;
    wire w_epg;

    even_paraty_g PG1(w_a,w_b,w_c,w_epg);
    even_paraty_g_tb PG2(w_epg,w_a,w_b,w_c);
    endmodule
    
