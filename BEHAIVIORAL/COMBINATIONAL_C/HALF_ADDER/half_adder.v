module half_adder(input a,b, output reg s,c);
    always @(a or b)
    begin
    if(~a && ~b)
        begin
        s=0; c=0;
        end
        else if(~a && b)
            begin
            s=1; c=0;
            end
            else if(a && ~b)
                begin
                s=1; c=0;
                end
                else
                    begin
                    s=1; c=1;
                    end
     end
 endmodule

 //testbench_code

 module half_adder_tb();
 reg a,b;
 wire s,c;

 half_adder HA(a,b,s,c);

initial 
repeat(20)
begin
a=$random; b=$random;  #5;
end
initial
$monitor("a=%b b=%b s=%b c=%b $time=%0t",a,b,s,c,$time);
endmodule

