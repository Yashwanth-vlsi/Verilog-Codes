module as1();
reg adder,mux4_1,enc,compe;
function reg[4:0] add(input [3:0]a,b, input cin); 
    begin
    add = a+b+cin;
    $display("a=%b b=%b cin=%b add=%b $time=%0t",a,b,cin,add,$time);
end
endfunction

function reg mux(input[3:0]i, input[1:0]s);
    begin
    mux=i[s];
    $display("i=%b s=%b mux=%b $time=%0t",i,s,mux,$time);
end
endfunction

function reg[1:0] en(input[3:0]i);
    begin
    case(i)
     4'b0001:en=2'b00;
     4'b0010:en=2'b01;
     4'b0100:en=2'b10;
     4'b1000:en=2'b11;
    endcase
    $display("i=%b en=%b  $time=%0t",i,en,$time);
end
endfunction

function reg[2:0] com(input[3:0]a,b);
reg g,l,e;
    begin
     {g,l,e} = {a>b,a<b,a==b};
    com = {g,l,e};
    $display("a=%b b=%b com=%b $time=%0t",a,b,com,$time);
end
endfunction

initial
begin
adder=add(5,4,1);
mux4_1=mux(3,3);
enc=en(4'b0100);
compe=com(5,6);
end
endmodule
