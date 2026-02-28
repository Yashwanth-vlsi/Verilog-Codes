module as3(input [3:0]da,db, input dcin, output [3:0]ds, output dcarry);
    assign {dcarry,ds}= da+db+dcin;
    endmodule

    // testbench code

module as3_tb();
    reg [3:0]da,db;
    reg dcin;
    wire [3:0]ds;
    wire dcarry;

    as3 F12(da,db,dcin,ds,dcarry);

    initial 
    begin
    da=$random; db=$random; dcin=$random; #5;
    end

    initial
    $monitor("da=%b db=%b dcin=%b ds=%b dcarry=%b $time=%0t",da,db,dcin,ds,dcarry,$time);
    endmodule


