module mop();
reg [31:0] add;
reg [31:0] sub;
reg [31:0] mul;
reg [31:0] div;

    function reg[31:0] add_fun(input [15:0]a,b);
         begin
         add_fun=a+b;
         $display("add_fun=%d a=%d b=%d $time%0t",add_fun,a,b,$time);
         end
    endfunction

  function reg[31:0] sub_fun(input [15:0] a,b);
         begin
         sub_fun=a-b;
          $display("sub_fun=%d a=%d b=%d $time%0t",sub_fun,a,b,$time);
         end
    endfunction

        function reg[31:0]  mul_fun(input [15:0]a,b);
         begin
         mul_fun=a*b;
          $display("mul_fun=%d a=%d b=%d $time%0t",mul_fun,a,b,$time);
         end
    endfunction

        function reg[31:0] div_fun(input [15:0]a,b);
         begin
         div_fun=a/b;
     $display("div_fun=%d a=%d b=%d $time%0t",div_fun,a,b,$time);         
         end
    endfunction
    initial  begin
    add=add_fun($random,$random);
    sub=sub_fun($random,$random);
    mul=mul_fun($random,$random);
    div=div_fun($random,$random);
   end  
  endmodule

  
