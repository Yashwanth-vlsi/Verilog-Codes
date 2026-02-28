module fa(
           input a,b,cin,
           output sum,carry
           );
    assign sum=a^b^cin;
    assign carry=a&b|b&cin|a&cin;
endmodule

module rcas #(parameter WI=32,MOD=1)(
           input [WI-1:0]a,b,
           input cin,
          // input bin,
           output [WI-1:0]sum,
           output carry
          );
    wire [WI:0]c;
    assign c[0]=cin;
    assign carry=c[WI];

  //  assign c[0]=bin;
    //assign barr=c[WI];


// generate block

    genvar i;

    generate
    begin
    
    if(MOD)
     
            for(i=0;i<WI;i=i+1)
            fs Fa(a[i],b[i],c[i],sum[i],c[i+1]);
     
      else//if(mod==1)
     
            for(i=0;i<WI;i=i+1)
            fs FS(a[i],~b[i],c[i],sum[i],c[i+1]);
     
      end
    endgenerate

endmodule   


//testbench

module rcas_tb #(parameter WI=32, MOD=0);
   reg [WI-1:0]a,b;
   reg cin;
   wire [WI-1:0]sum;
   wire carry;

// integer inp,out;

   // rcas #(.WI(WI)) RC(a,b,bin,dif,barr);
    rcas RC(a,b,cin,sum,carry);
    defparam RC.MOD = MOD;
     defparam RC.WI = WI;


  initial
    repeat(10)
    begin

    if(MOD)
    begin
    a=$urandom_range(40,100); b=$urandom_range(10,30); cin=$random;  #1;
    end

    else
        
    begin
    a=$urandom_range(40,100); b=$urandom_range(10,30); cin=1; #1;
    end

    end
 
    initial
    if(MOD)
        
    $monitor("a=%0d b=%0d cin=%0d sum=%0d carry=%0d  $time=%0t",a,b,cin,sum,carry,$time);

    else 
        $monitor("a=%0d b=%0d  bin=%0d diff=%0d bout=%0d $time=%0t",a,b,cin,sum,carry,$time);

    endmodule
