module fsm_moore_1010 #(parameter s0=0,s1=1,s2=2,s3=3,s4=4)(
                input clk,rst,
                input x,
                output y);

reg[2:0]cs,ns;
assign y=(cs==s3)?1:0;

always @ (posedge clk or negedge rst)
    begin
        if(!rst)
            cs<=0;
            else
                cs<=ns;
    end

always @ (*)
    begin
        case(cs)
        s0: if(x==1)
                 ns<=s1;
            else
                ns<=s0;
        s1: if(x==0)
                 ns<=s2;
            else
                ns<=s1;
        s2: if(x==1)
                 ns<=s3;
            else
                ns<=s2;
         s3: if(x==0)
                 ns<=s4;
            else
                ns<=s3;
         s4: if(x==0)
                 ns<=s0;
            else
                ns<=s1;
        endcase            
    end
endmodule

// testbench_code

module tb();
    reg clk,rst;
    reg x;
    wire y;

fsm_moore_1010  MO(clk,rst,x,y);

    initial
    clk=0;
    always #20 clk=!clk;

    initial
    begin
    rst=0;
    #5 rst=1;
    end

    initial
    repeat(20)
    begin
    x=0; #20;
    x=1; #40;
    x=0; #40;
    x=1; #40;
    x=0; #40;
    end

    initial
    #400 $stop;

    initial
    $monitor("clk=%b rst=%b x=%b y=%b $time=%0t",clk,rst,x,y,$time);
    endmodule

