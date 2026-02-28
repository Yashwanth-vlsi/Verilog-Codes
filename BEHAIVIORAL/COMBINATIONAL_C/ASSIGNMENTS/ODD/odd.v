module oe();
    integer i;
initial
    begin
    for(i=1;i<20;i=i+1)
        begin
        if((i%2)!==0)
            $display("number=%d",i);
          /*  else
            $display("number=%d",i);
            */
        end
        
    end
endmodule
