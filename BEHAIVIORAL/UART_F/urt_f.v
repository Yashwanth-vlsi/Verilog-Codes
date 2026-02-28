module urt(input start,
            input [7:0]data,
            input paraty,
            input [1:0]stop,
            output reg [11:0]frame
            );
 //assign frame={start,data,paraty,stop};

   function reg[11:0] frame_y(input start, input[7:0]data, input paraty, input [1:0]stop);
  // reg [11:0]frame_y;
    begin
            frame_y[11]=start;
            frame_y[10:3]=data;
            frame_y[2]=paraty;
            frame_y[1:0]=stop;
    end
    endfunction

    always@(*)
    frame=frame_y(start,data,paraty,stop);
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
        begin
     start=1'b1; data=$random; paraty=^data; stop=2'b00; #10;
     start=1'b1; data=$random; paraty=^data; stop=2'b00; #10;
     start=1'b1; data=$random; paraty=^data; stop=2'b00; #10;
     start=1'b1; data=$random; paraty=^data; stop=2'b00; #10;
         end

    initial
    $monitor("start=%b data=%b paraty=%b stop=%b frame=%b $time=%0t",start,data,paraty,stop,frame,$time);
    endmodule

