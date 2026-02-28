module demux1_4(y,s,d);
    input y;
    input [1:0]s;
    output [3:0]d;
    assign d[0] =~s[0]&~s[1]&y;
    assign d[1] =s[0]&~s[1]&y;
    assign d[2] =~s[0]&s[1]&y;
    assign d[3] =s[0]&s[1]&y;
endmodule


// testbench code

module demux1_4_tb();
    reg y;
    reg [1:0]s;
    wire [3:0]d;
    demux1_4 DM(y,s,d);
    initial
    repeat (8)
    begin
    s=$random; y=1; #10;
    end
    initial 
    $monitor("y=%b s=%b d=%b $time=%0t",y,s,d,$time);
    endmodule

