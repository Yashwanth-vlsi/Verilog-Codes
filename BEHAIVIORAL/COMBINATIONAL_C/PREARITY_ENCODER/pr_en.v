module pec(
            input[3:0]in,
            output reg [1:0]y);

    always @ (in)
       /* casex(in)
        4'b0001 : y=2'b00;
        4'b001x : y=2'b01;
        4'b01xx : y=2'b10;
        4'b1xxx : y=2'b11;
        endcase
        */
       /* casez(in)
        4'b0001 : y=2'b00;
        4'b001z : y=2'b01;
        4'b01zz : y=2'b10;
        4'b1zzz : y=2'b11;
        endcase
        */
         case(1)
        in[3]: y=2'b11;
        in[2]: y=2'b10;
        in[1]: y=2'b01;
        in[0]: y=2'b00;
        endcase

endmodule

// testbench code

module pec_tb();
    reg [3:0]in;
    wire [1:0]y;

    pec PE(in,y);

    initial
    repeat(10)
    begin
    in=$random; #10;
    end

    initial
    $monitor("in=%b y=%b $time=%0t",in,y,$time);
    endmodule
