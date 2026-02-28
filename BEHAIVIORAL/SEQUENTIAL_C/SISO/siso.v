`include"da_ff.v"
module siso(clk,rst,d,Q);
    input clk,rst,d;
    output Q;
    wire [2:0]q;
   // assign Q=q[3];
    
    da_ff DFF1(clk,rst,d,q[0]);
    da_ff DFF2(clk,rst,q[0],q[1]);
    da_ff DFF3(clk,rst,q[1],q[2]);
    da_ff DFF4(clk,rst,q[2],Q);

    endmodule

    // testbench code 

module siso_tb();
    reg clk,rst,d;
    wire Q;

    siso SO(clk,rst,d,Q);
    
     initial clk=0;
  always #10 clk=~clk;

 initial
   begin
     rst=0;
     #10 rst=1;
     
     d=1; #20;
     d=0; #20;
     d=1; #20;
     d=0; #20;
   end
   initial 
   #200 $stop;
   initial
    $monitor("clk=%b rst=%b d=%b Q=%b $time=%0t",clk,rst,d,Q,$time);
endmodule






            
