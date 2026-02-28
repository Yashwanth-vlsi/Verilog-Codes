module fsm_p #(parameter idel=0,setup=1,acess=2)(
                                            input clk,rst,
                                            input pready,transfor,pwrite,
                                            output reg psel,penable);
    reg[1:0]cs,ns;

    always @ (posedge clk or negedge rst)
        begin
            if(!rst)
                   begin
                     psel<=0;
                     penable<=0;
                     cs<=0;
                   end
               else
                    cs<=ns;
        end
    always @ (*)
        begin
            case(cs)
            idel : if(transfor==1)
                        begin
                         ns=setup;
                         psel=1;
                         penable=0;
                    end
                   else
                       begin
                          ns=idel;
                          psel=0;
                          penable=0;
                       end

             setup : if(transfor==1)
                        begin
                         ns=acess;
                         psel=1;
                         penable=1;
                        end
                   else
                      begin
                          ns=setup;
                          psel=0;
                          penable=0;
                      end

              acess :  if(pready==0)
                        begin
                            ns=acess;
                            psel=1;
                            penable=1;
                        end
                        else
                            begin
                         if(transfor==1)
                            begin
                             ns=setup;
                             psel=1;
                             penable=0;
                             end
                        else 
                          begin
                              ns=idel;
                              psel=0;
                              penable=0;
                       end
                       end
                            endcase
        end
endmodule

// testbench_code

module fsm_tb();
    reg clk,rst;
    reg transfor,pready,pwrite;
    wire psel,penable;

    fsm_p P1(clk,rst,pready,transfor,pwrite,psel,penable);

initial 
    clk=0;
always #5 clk=~clk;

initial
    begin
    rst=0;
    #20 rst=1;
    end

initial
begin
wait(rst);
/*
transfor=0;
 #20;

    transfor=1; #10;
    transfor=1; #10;
    pready=0; #10;
    pready=0; #10;
    transfor=0; 
   pready=1; #10;
    transfor=0; #10;
    pwrite=1;#10;
 //   end
 */

 transfor=0;
  @(posedge clk);
 transfor=1;
  #20;
  @(posedge clk);
  pready=0;
   repeat(2)
    @(posedge clk);
    pready=1;

    end

    always @( posedge clk or P1.cs)
        begin
            case (P1.cs)
            0 : $display("idel");
            1 : $display("setup");
            2 : $display("acess");
            endcase
        end
 always @ (posedge clk)
    begin
        if(P1.cs==P1.acess && penable==1 && pwrite==1)
            $display("hi");
        else if
            (P1.cs==P1.acess && penable==1 && pwrite==0)
             $display("bye");

    end

initial 
    $monitor("clk=%b rst=%b  transfer=%b pready=%b psel=%b penable=%b pwrite=%b $time=%0t",clk,rst,transfor,pready,psel,penable,pwrite,$time);
endmodule




