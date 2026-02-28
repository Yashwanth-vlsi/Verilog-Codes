module mux(i,s,y);
    input [3:0]i;
    input [1:0]s;
    output reg y;
    always @(i or s) begin
        if(s==0)
            y=i[0];
            else 
                if(s==1)
                    y=i[1];
                    else
                        if(s==2)
                            y=i[2];
                            else
                                y=i[3];
                            end
                            endmodule

     
     // testbench code


module mux_tb();
    reg [3:0]i;
    reg [1:0]s;
    wire y;

mux MX(i,s,y);

 initial 
    repeat(8)
    begin
    i=$random; s=$random; #10;
 end
initial
 $monitor("i=%b s=%b y=%b $time=%0t",i,s,y,$time);
 endmodule



