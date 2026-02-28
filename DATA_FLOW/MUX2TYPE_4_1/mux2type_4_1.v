module mux(i,s,y);
    parameter WIDTH=4;
    input [WIDTH -1:0]i;
    input [$clog2(WIDTH) -1:0]s;
    output y;

    assign y = i[s];

endmodule

// tb code

module mux_tb(tb_y,tb_i,tb_s);
    parameter WIDTH=4;
    input tb_y;
    output reg [WIDTH -1:0]tb_i;
    output reg [$clog2(WIDTH)-1:0]tb_s;

    integer x;
    
    initial
    begin
    tb_i=$random;
    for(x=0;x<WIDTH;x=x+1)
        begin
        tb_s=x; #10;
        end
    end
initial
    $monitor("i=%b s=%b y=%b",tb_i,tb_s,tb_y);
    endmodule


// top code


module top();
    parameter WIDTH=8;
    wire [WIDTH-1:0]w_i;
    wire[$clog2(WIDTH)-1:0]w_s;
    wire w_y;

    
    mux MX(w_i,w_s,w_y);
    mux_tb MT(w_y,w_i,w_s);
    defparam MX.WIDTH=WIDTH;
    defparam MT.WIDTH=WIDTH;
    endmodule
