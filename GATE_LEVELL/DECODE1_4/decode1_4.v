module decode1_4(
    input [31:0]a,
    output s1,s2,s3,s4
        );

and G1(s1,~a[18],~a[17],a[16]);
and G2(s2,~a[18],a[17],~a[16]);
and G3(s3,~a[18],a[17],a[16]);
and G4(s4,a[18],~a[17],~a[16]);
endmodule

// testbench code

module decode1_4_tb();
    reg [31:0]a;
    wire s1,s2,s3,s4;

    decode1_4 DC(a,s1,s2,s3,s4);
    initial
    begin
     a[31:0]=0; a[16]=1; #10;
     a[31:0]=0; a[17]=1; #10;
     a[31:0]=0; a[17]=1;a[16]=1;  #10;
     a[31:0]=0; a[18]=1; #10;
     end
 initial
    $monitor("a=%b s1=%b s2=%b s3=%b s4=%b ",a,s1,s2,s3,s4);
    endmodule

