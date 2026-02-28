//design code
module allcomperator(a,b,g,l,e);
    parameter WIDTH = 4;
    input [WIDTH-1:0]a,b;
    output g,l,e;

    assign {g,l,e} = {a>b,a<b,a==b};
    endmodule

// tb code

module allcomperator_tb(tb_g,tb_l,tb_e,tb_a,tb_b);
    parameter WIDTH = 4;
    input tb_g,tb_l,tb_e;
    output reg [WIDTH-1:0]tb_a,tb_b;

    initial
    repeat (200)
    begin
    tb_a=$random; tb_b=$random; #10;
    end
    initial
    $monitor("a=%b b=%b g=%b l=%b e=%b",tb_a,tb_b,tb_g,tb_l,tb_e);
    endmodule

    
    // top code

 module top ();
    parameter WIDTH = 2;
    wire [WIDTH-1:0]w_a,w_b;
    wire w_g,w_l,w_e;
    allcomperator AC(w_a,w_b,w_g,w_l,w_e);
    allcomperator_tb TC(w_g,w_l,w_e,w_a,w_b);
    defparam AC.WIDTH=WIDTH;
    defparam TC.WIDTH=WIDTH;
endmodule

