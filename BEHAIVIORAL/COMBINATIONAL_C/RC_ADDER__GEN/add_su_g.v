module fa(
           input a,b,cin,
           output sum,carry
           );
    assign sum=a^b^cin;
    assign carry=a&b|b&cin|a&cin;
endmodule

module rcas #(parameter WI=32)(
           input [WI-1:0]a,b,
           input cin,
           output [WI-1:0]sum,
           output carry
           );
wire [WI:0]c;
assign c[0]=cin;
assign carry=c[WI];

// generate block

    genvar i;

    generate
    for(i=0;i<WI;i=i+1)
        fa FA(a[i],b[i],c[i],sum[i],c[i+1]);

    endgenerate
endmodule


//testbench

module rcas_tb #(parameter WI=128);
    reg [WI-1:0]a,b;
    reg cin;
    wire [WI-1:0]sum;
    wire carry;

    integer inp,out;

    rcas #(.WI(WI)) RC(a,b,cin,sum,carry);
   // rcas RC(a,b,cin,sum,carry);
   // defparam RC.WI = 64;

   initial
   begin
   inp=$fopen("inp.txt");
   out=$fopen("out.txt");
    $readmem("input_file.txt",memo);
    repeat(10)
    begin
   // a=$urandom_range(0,100); b=$urandom_range(0,100); cin=$urandom; 
    {a,b,cin}={mem[],mem[],mem[]};
    $fdisplay(inp,"a=%0d b=%0d cin=%0d",a,b,cin); #1;
    $fdisplay(out,"sum=%0d carry=%0d",sum,carry);
    #10;
    end
    $fclose("inp");
    $fclose("out");
    end

 //   initial 
   // $monitor("a=%0d b=%0d cin=%0d sum=%0d carry=%0d $time=%0t",a,b,cin,sum,carry,$time);
    endmodule
