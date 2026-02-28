module demux1_8(y,s,d);
    input y;
    input [2:0]s;
    output [7:0]d;
    assign d[0] =~s[2]&~s[1]&~s[0]&y;
    assign d[1] =~s[2]&~s[1]&s[0]&y;
    assign d[2] =~s[2]&s[1]&~s[0]&y;
    assign d[3] =~s[2]&s[1]&s[0]&y;
    assign d[4] =s[2]&~s[1]&~s[0]&y;
    assign d[5] =s[2]&~s[1]&s[0]&y;
    assign d[6] =s[2]&s[1]&~s[0]&y;
    assign d[7] =s[2]&s[1]&s[0]&y;

endmodule


// testbench code

module demux1_8_tb();
    reg y;
    reg [2:0]s;
    wire [7:0]d;
    demux1_8 DM(y,s,d);
    initial
    repeat (10)
    begin
    s=$random; y=1; #10;
    end
    initial 
    $monitor("y=%b s=%b d=%b $time=%0t",y,s,d,$time);
    endmodule

