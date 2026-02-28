module mux8_1(i,s,y);
    input [8:0] i;
    input [2:0] s;
    output y;

    //assign y = i[s];
    assign y = (s[2]==0 && s[1]==0 && s[0]==0)? i[0] : (s[2]==0 && s[1]==0  && s[0]==1 )? i[1] :(s[2]==0 && s[1]==1 && s[0]==0)? i[2]:(s[2]==0 && s[1]==1 && s[0]==1)?i[3] :(s[2]==1 && s[1]==0 && s[0]==0)?i[4] : (s[2]==1 && s[1]==0 && s[0]==1)?i[5] : (s[2]==1 && s[1]==1 && s[0]==0)?i[6] :i[7];
endmodule

//testbench code

module mux8_1_tb();
    reg [8:0]i;
    reg [2:0]s;
    wire y;
    mux8_1 M1(i,s,y);
    initial 
    repeat (12)
    begin
    i=$random; s=$random; #10;
    end
    initial
    $monitor("i=%b s=%b y=%b $time=%0t",i,s,y,$time);
    endmodule

