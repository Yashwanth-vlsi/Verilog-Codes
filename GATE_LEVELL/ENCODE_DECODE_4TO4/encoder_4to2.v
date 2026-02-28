module encoder_4to2(input d0,d1,d2,d3, output y0,y1);
or G1(y0,d3,d1);
or G2(y1,d2,d3);
endmodule


//testbench code

module encoder_4to2_tb();
reg d0,d1,d2,d3;
wire y0,y1;

encoder_4to2 EC(
                d0,d1,d2,d3,y0,y1
                );
initial 
begin
    d0=1; d1=0; d2=0; d3=0; #10;
    d0=0; d1=1; d2=0; d3=0; #10;
    d0=0; d1=0; d2=1; d3=0; #10;
    d0=0; d1=0; d2=0; d3=1; #10;
 end
 initial
    $monitor("d0=%0b      d1=%0b      d2=%0b      d3=%0b     y0=%0b      y1=%0b     $time=%0t",d0,d1,d2,d3,y0,y1,$time);
 endmodule
