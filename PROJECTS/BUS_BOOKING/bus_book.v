module BB #(parameter idle=0,open_app=1,location=2,filter=3,select_bus=4,select_seat=5,boarding_droping=6,coupon=7,payment=8,don=9)(
   input clk,rst,
   input x,
   output reg y);

reg [3:0]cs,ns;

always@(posedge clk or negedge rst)
    begin
        if(!rst)
      begin
             cs<=0;
             y<=0;
      end
        
        else
            cs<=ns;
        
    end
always @(*)
    begin
    y<=0;
        case(cs)
            idle : if(x==1)
                        ns<=open_app;
                        //y<=0;
                    else
                        ns<= idle;
                      //  y<=0;

            open_app : if(x==1)
                        ns<=location;
                       // y<=0;
                    else
                        ns<= open_app;
                       // y<=0;
             location : if(x==1)
                        ns<=filter;
                      //  y<=0;
                    else
                        ns<= idle;
                       // y<=0;

            filter: if(x==1)
                        ns<=select_bus;
                       // y<=0;

             select_bus : if(x==1)
                        ns<=select_seat;
                       // y<=0;
                    else
                        ns<= select_bus;
                       // y<=0;

             select_seat : if(x==1)
                        ns<=boarding_droping;
                       // y<=0;

             boarding_droping: if(x==1)
                        ns<=coupon;
                       // y<=0;
            
             coupon : if(x==1)
                        ns<=payment;
                       // y<=0;
                
              payment : if(x==1)
                        ns<=don;
                       // y<=0;

              don: if(x==1)
              begin
                      ns<=don;
                     y<=1;
               end
       endcase
    end
endmodule

// testbench_code

module tb();
    reg clk,rst;
    reg x;
    wire y;


 BB B1(clk,rst,x,y);

 initial 
 clk=0;
 always #20 clk=!clk;

 initial
     begin
         rst=0;
         #5 rst=1;
     end

/*always@(y)
    if(y==1)
        $display("ticket booked sucessfully");*/

always@(B1.cs)
    begin
     case(B1.cs)
     0 : $display("opean app");
     1 : $display("bus portal open");
     2 : $display(" enter the locations");
     3 : $display(" apply filters");
     4 : begin
         $display("select buses");
         $display("select the seats");
         end
     5 : begin 
        $display("select bording point");
        $display("select droping point");
            end
     6 : $display("applay coupens you have");
     7 : $display("make the payment");
     8 : $display("payment done sucessfull");
     9 : $display("ticket booked sucessfully");
      endcase
    end
    
initial
    begin
        x=0; #30;
    repeat(10)
    begin
    x=1; #10;
    end
    end

initial
    wait(y==1)
    $stop;

initial
    $monitor("clk=%b rst=%b x=%b y=%b $time=%0t",clk,rst,x,y,$time);
endmodule


