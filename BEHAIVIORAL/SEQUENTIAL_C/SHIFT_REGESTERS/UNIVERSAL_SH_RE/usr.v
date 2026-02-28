module uns(input clk,rst, input [3:0]in, input [1:0]sel, output reg [3:0]dout);
    reg [3:0]temp;

    always @ (posedge clk or negedge rst)
    begin
    if(!rst)
        begin
          dout<=0;
          temp=0;
        end
        else // rst=1
            begin
                case (sel)
                0 : dout<=dout;
                
                1 :begin
                temp<={in[0],temp[3:1]};
                dout<=temp[0];
                        end
                2 :begin
                temp<={temp[2:0],in[0]};
                dout<=temp[3];
                        end
                3 :begin
                temp<=in;
                dout<=temp;
                        end
                endcase
            end
    end
endmodule


// testbench code

module uns_tb();
    reg clk,rst;
    reg [3:0]in;
    reg [1:0]sel;
    wire [3:0]dout;

uns US(clk,rst,in,sel,dout);

initial 
    clk=0;
    always #10 clk=~clk;

initial 
    begin
    rst=0;
    #10 rst=1;
    end

    initial 
    begin
     in=1001; sel=3; 
    end

    initial
  #200  $stop;

  initial
  $monitor("clk=%b rst=%b in=%b sel=%d dout=%b $time=%0t",clk,rst,in,sel,dout,$time);
  endmodule
