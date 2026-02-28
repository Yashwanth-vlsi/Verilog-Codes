module full_adder(input a,b,cin, output reg s,carry);
    always @ (a,b,cin)
    begin
             if(~a && ~b && ~cin)
             begin
             s=0; carry=0;
             end
        else if(~a && ~b && cin)
            begin
            s=1; carry=0;
            end
        else if(~a && b && ~cin)
            begin
            s=1; carry=0;
            end
        else if(~a && b && cin)
            begin
            s=0; carry=1;
            end
        else if(a && ~b && ~cin)
            begin
            s=1; carry=0;
            end
         else if(a && ~b && cin)
            begin
            s=0; carry=1;
            end
         else if(a && b && ~cin)
            begin
            s=0; carry=1;
            end
         else
            begin
                s=1; carry=1;
            end
   end
 endmodule

// testbench code

module full_adder_tb();
reg a,b,cin;
wire s,carry;

full_adder FA(a,b,cin,s,carry);

initial
repeat(20)
    begin
    a=$random;  b=$random;  cin=$random; #5;
    end
    initial
    $monitor("a=%b b=%b cin=%b s=%b carry=%b $time=%0t",a,b,cin,s,carry,$time);
    endmodule
    
