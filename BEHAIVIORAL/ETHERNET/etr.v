module etr(
            input[55:0]preamble,
            input[7:0]sfd,
            input[47:0]dstad,
            input[47:0]srcad,
            input[15:0]length,
            input[367:0]data,
            input[31:0]crc,
            output reg[575:0]frame
            );

    always @ (*)
        begin
            frame={preamble,sfd,dstad,srcad,length,data,crc};

        end
endmodule

// testbench_code

module etr_tb();   
            reg[55:0]preamble;
            reg[7:0]sfd;
            reg[47:0]dstad;
            reg[47:0]srcad;
            reg[15:0]length;
            reg[367:0]data;
            reg[31:0]crc;
            wire[575:0]frame;


    etr ET( preamble,sfd,dstad,srcad,length,data,crc,frame);

    initial
    repeat(2)
    begin
    preamble={28{2'b10}}; sfd=8'b10101011; dstad=$random; srcad=$random; length=$random; data=$random; crc=$random;
        #100;
    end

    initial
    $monitor("preamble=%b sfd=%b dstad=%b srcad=%b length=%b data=%b crc=%b frame=%b",preamble,sfd,dstad,srcad,length,data,crc,frame);
    endmodule
