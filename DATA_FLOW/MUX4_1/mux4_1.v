module mux4_1(i,s,y);
    input [3:0] i;
    input [1:0] s;
    output y;

    //assign y = i[s];
    assign y = (s[1]==0 && s[0]==0)?i[0] : (s[1]==0  && s[0]==1 )? i[1] :(s[1]==1 && s[0]==0)? i[2]:i[3];
endmodule

//testbench code

module mux4_1_tb ();
    reg [3:0]i;
    reg [1:0]s;
    wire y;
    mux4_1 M1(i,s,y);
    initial 
    repeat (8)
    begin
    i=$random; s=$random; #10;
    end
    initial
    $monitor("i=%b s=%b y=%b $time=%0t",i,s,y,$time);
    endmodule

