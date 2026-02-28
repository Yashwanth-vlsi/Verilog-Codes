//dut code
module logical_arth(a,b,s,y);
    parameter width = 8;
    input [width/2-1:0]a,b;
    input [width-1:0]s;
    output [width-1:0]y;
    assign y =(s==7)?{a,b}:(s==6)?&a:(s==5)?a&b:(s==4)?a&&b:(s==3)?a/b:(s==2)?a*b:(s==1)?a+b:a-b;
endmodule

//tb code

module logical_arth_tb(tb_y,tb_s,tb_a,tb_b);
    parameter width = 8;
    input [width-1:0]tb_y;
    output reg [width/2-1:0]tb_a,tb_b;
    output reg [width-1:0]tb_s;

    integer x;

    initial
     begin
    tb_a=$random; tb_b=$random; 
    for(x=0;x<width;x=x+1)
        begin
        tb_s=x; #10;
        end
     end
      initial
    $monitor("a=%b b=%b s=%b y=%b ",tb_a,tb_b,tb_s,tb_y,);
    endmodule

    // top code

    
    module top();
    parameter width=8;
    wire [width/2-1:0]w_a,w_b;
    wire [width-1:0]w_s;
    wire [width-1:0]w_y;
    logical_arth DT(w_a,w_b,w_s,w_y);
    logical_arth_tb TB(w_y,w_s,w_a,w_b);
    endmodule
