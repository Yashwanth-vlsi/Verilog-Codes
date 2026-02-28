module operators();
    reg [15:0] a,b;
    reg [15:0]y;
    reg s;
    initial begin
    a=8;
    b=2;

    $display(" logical operation");
    y=a&b; #10;
    $display(" AND a=%0b b=%0b y=%0d",a,b,y);
    y=a|b; #10;
    $display(" OR a=%0b b=%0b y=%0d",a,b,y);
    y=~(a&b); #10;
    $display(" NAND a=%0b b=%0b y=%0d",a,b,y);
    y=a^b; #10;
    $display(" XOR a=%0b b=%0b y=%0d",a,b,y);
    y=~(a^b); #10;
    $display("XNOR a=%0b b=%0b y=%0d",a,b,y);

    $display(" arthmetic operation");
    y=a+b; #10;
    $display("ADD a=%0b b=%0b y=%0d",a,b,y);
    y=a-b; #10;
    $display("SUB a=%0b b=%0b y=%0d",a,b,y);
    y=a*b; #10;
    $display(" MULTIPLAY a=%0b b=%0b y=%0d",a,b,y);
    y=a/b; #10;
    $display(" DIVISION a=%0b b=%0b y=%0d",a,b,y);

    $display(" equality operators");
    y=a==b; #10;
    $display(" EQUAL a=%0b b=%0b y=%0d",a,b,y);
    y=~(a==b); #10;
    $display(" NOTEQUAL a=%0b b=%0b y=%0d",a,b,y);
    y=a<<b; #10;
    $display(" SMALLER a=%0b b=%0b y=%0d",a,b,y);
    y=a>>b; #10;
    $display(" GREATER a=%0b b=%0b y=%0d",a,b,y);

    $display(" conditional operators");
    s=1;
    y=(s==1)?a:b;
    $display(" TERNARY a=%0b b=%0b y=%0d",a,b,y);
    s=0;
    y=(s==0)?a:b;
    $display(" TEARNARY a=%0b b=%0b y=%0d",a,b,y);

    $display(" shift operators");
    y=a<<3;
    $display(" logical left shift a=%0b b=%0b y=%0d",a,b,y);
    y=b>>2;
    $display(" LOGICAL RIGHT SHIFT a=%0b b=%0b y=%0d",a,b,y);
    y=a>>>2;
    $display(" airthmetic left shift a=%0b b=%0b y=%0d",a,b,y);
    y=a<<<3;
    $display(" airthmetic right shift a=%0b b=%0b y=%0d",a,b,y);

    $display(" cancation operators");
    y={a[3:0],b[3:0]};
    $display(" cancation a=%0b b=%0b y=%0b",a,b,y);
    end
endmodule 
