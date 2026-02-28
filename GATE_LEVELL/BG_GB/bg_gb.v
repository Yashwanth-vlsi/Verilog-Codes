`include"binary_gray.v"
`include"gray_binary.v"
module bg_gb(input [3:0]b, output [3:0]y);
    wire [3:0]w;
    binary_gray BG(b,w);
    gray_binary GB(w,y);
endmodule

// testbench code

module bg_gb_tb();
    reg [3:0]b;
    wire [3:0]y;
    bg_gb BB(b,y);
    initial 
    repeat(10)
    begin
        b=$random; #10;
    end
initial
    $monitor("b=%b y=%b $time=%0t",b,y,$time);
endmodule

 

