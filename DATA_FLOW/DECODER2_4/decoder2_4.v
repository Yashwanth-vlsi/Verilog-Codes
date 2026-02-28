module decoder2_4(y,i);
    input [1:0]y;
    output [3:0]i;
    assign i[0] = ~y[1]&~y[0];
    assign i[1] = ~y[1]&y[0];
    assign i[2] = y[1]&~y[0];
    assign i[3] = y[1]&y[0];
    
endmodule

//testbench code

module decoder2_4_tb();
    reg [1:0]y;
    wire [3:0]i;
    decoder2_4 DE(y,i);
    initial 
    repeat(10)
    begin
    y=$random;  #10;
    end
    initial
    $monitor(" y=%b i=%b  $time=%0t",y,i,$time);
    endmodule
