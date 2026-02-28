module encoder4_2(i,y);
    input [3:0]i;
    output [1:0]y;
    assign y[0] = i[1]|i[3];
    assign y[1] = i[2]|i[3];
endmodule

//testbench code

module encoder4_2_tb();
    reg [3:0]i;
    wire [1:0]y;
    encoder4_2 EN(i,y);
    initial 
    repeat(5)
    begin
    i=$random;  #10;
    end
    initial
    $monitor("i=%b y=%b $time=%0t",i,y,$time);
    endmodule
