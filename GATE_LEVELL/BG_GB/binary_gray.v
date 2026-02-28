module binary_gray(input [3:0]b, output [3:0]g);
    buf G1(g[3],b[3]);
    xor G2(g[2],b[3],b[2]);
    xor G3(g[1],b[2],b[1]);
    xor G4(g[0],b[1],b[0]);
endmodule

//testbench code
module binary_gray_tb();
    reg [3:0]b;
    wire [3:0]g;
    binary_gray BG(b,g);
initial 
    repeat(10) 
    begin
    b=$random; #10;
    end
initial
    $monitor(" b=%0b             g=%0b             $time=%0t    ",b,g,$time);
endmodule


