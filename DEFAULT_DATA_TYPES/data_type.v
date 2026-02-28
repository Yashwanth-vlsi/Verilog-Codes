module data_type();
  reg a;
  integer b;
  wand c;
  wor d;
  wire e;
  time f;
  supply0 g;
  supply1 h;
  tri i;
  tri0 j;
  tri1 k;
  real l;
 initial
   $monitor("a=%b b=%b c=%b d=%b e=%b f=%b g=%b h=%b i=%b j=%b k=%b l=%b $time=%t",a,b,c,d,e,f,g,h,i,j,k,l,$time);
endmodule
