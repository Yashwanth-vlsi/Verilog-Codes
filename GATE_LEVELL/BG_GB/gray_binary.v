module gray_binary(input [3:0]g, output [3:0]b);
    buf G1(b[3],g[3]);
    xor G2(b[2],b[3],g[2]);
    xor G3(b[1],b[2],g[1]);
    xor G4(b[0],b[1],g[0]);
endmodule

//testbench code
module gray_binary_tb();
    reg [3:0]g;
    wire [3:0]b;
    gray_binary GB(g,b);
initial 
    repeat(10) 
    begin
    g=$random; #10;
    end
initial
    $monitor(" g=%0b             b=%0b             $time=%0t    ",g,b,$time);
endmodule


