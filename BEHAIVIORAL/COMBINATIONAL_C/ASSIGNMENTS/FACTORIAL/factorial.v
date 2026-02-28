module fct();
    integer b;
    integer value;

function integer fac(input integer num);
    integer i;
    begin 
    fac=1;
        for(i=1;i<=num;i=i+1)
            begin
            fac=fac*i;
            end
    end
    endfunction

initial
  begin
    value=6;
    b=fac(value);
    $display("factorial of valve=%d is=%d",value,b);
    
    value=9;
    b=fac(value);
    $display("factorial of valve=%d is=%d",value,b);
  end
endmodule
