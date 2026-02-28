module urt(input start,
            input [7:0]data,
            input paraty,
            input [1:0]stop,
            output  [11:0]frame
            );
 //assign frame={start,data,paraty,stop};

   always @ (*)
    begin
            frame[11]=start;
            frame[10:3]=data;
            frame[2]=paraty;
            frame[1:0]=stop;
    end
    
endmodule

//testbench code

module urt_tb();
    reg start;
    reg [7:0]data;
    reg paraty;
    reg [1:0]stop;
    wire [11:0]frame;

    urt UR(start,data,paraty,stop,frame);

    initial
    repeat(10)
    begin
    start=1'b1; data=$random; paraty=^data; stop=2'b00; #10;
    end

    initial
    $monitor("start=%b data=%b paraty=%b stop=%b frame=%b $time=%0t",start,data,paraty,stop,frame,$time);
    endmodule

