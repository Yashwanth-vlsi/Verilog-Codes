module fifo #(parameter width=8, depth=8)
             (
                input      w_clk,r_clk,rst,write,read,
                input      [width-1:0]datain,
                output reg [width-1:0]dataout,
                output     empty,full
              );

    reg [$clog2(depth)-1:0]wr_ptr_bin,re_ptr_bin;
    reg [$clog2(depth)-1:0]wr_ptr_gry,re_ptr_gry;
    reg[width-1:0]mem[depth-1:0];
    integer i,count;
    

   assign empty =(count==0);
   assign full  =(count==depth);

//------------  WRITE -------------------
always @(posedge w_clk or negedge rst)
    begin
    if(!rst)
        begin
            dataout<=0;
            count<=0;
            wr_ptr_bin<=0;
            wr_ptr_gry<=0;
        end
        
     else 
         if(write && !full)
             begin
                  mem[wr_ptr_bin]<=datain;
                  wr_ptr_bin<=wr_ptr_bin+1;
                  count<=count+1;
                  wr_ptr_gry<=wr_ptr_bin^(wr_ptr_bin>>1);
             end
      end
//------------  READ -------------------

always @(posedge r_clk or negedge rst)
    begin
        if(!rst)
            begin
                dataout<=0;
                re_ptr_bin<=0;
                re_ptr_gry<=0;
            end
        
          else
              if(read && !empty)
                  begin
                    dataout<=mem[re_ptr_bin];
                    re_ptr_bin<=re_ptr_bin+1;
                    count<=count-1;
                    re_ptr_gry<=re_ptr_bin^(re_ptr_bin>>1);
                  end
      end

// Synchronize read pointer (Gray) into write domain
reg[$clog2(depth)-1:0] re_ptr_gry_sync1, re_ptr_gry_sync2;
always @(posedge r_clk or negedge rst)
begin
    if (!rst)
        begin
            re_ptr_gry_sync1 <= 0;
            re_ptr_gry_sync2 <= 0;
        end 
    else
        begin
            re_ptr_gry_sync1 <= re_ptr_gry;        // 1st FF
            re_ptr_gry_sync2 <= re_ptr_gry_sync1;  // 2nd FF
        end
end

// Synchronize write pointer (Gray) into read domain
reg[$clog2(depth)-1:0] wr_ptr_gry_sync1, wr_ptr_gry_sync2;
always @(posedge w_clk or negedge rst)
begin
    if (!rst) 
        begin
            wr_ptr_gry_sync1 <= 0;
            wr_ptr_gry_sync2 <= 0;
        end 
    else 
        begin
            wr_ptr_gry_sync1 <= wr_ptr_gry;    //1st ff
            wr_ptr_gry_sync2 <= wr_ptr_gry_sync1; // 2nd ff
        end
end

endmodule


// testbench code




module tb_fifo;

    // Parameters
    parameter width = 8;
    parameter depth = 8;

    // Signals
    reg w_clk, r_clk, rst, write, read;
    reg [width-1:0] datain;
    wire [width-1:0] dataout;
    wire empty, full;

    // DUT instantiation
    fifo #(width, depth) dut (
                                .w_clk(w_clk),
                                .r_clk(r_clk),
                                .rst(rst),
                                .write(write),
                                .read(read),
                                .datain(datain),
                                .dataout(dataout),
                                .empty(empty),
                                .full(full)
                              );

    // Clock generation
    initial
        begin
            w_clk = 0;
        forever #5 w_clk = ~w_clk;   // Write clock (10 ns period)
    end

    initial 
        begin
            r_clk = 0;
        forever #7 r_clk = ~r_clk;   // Read clock (14 ns period)
    end

    // Test stimulus
    initial
        begin
            rst = 0;
            write = 0;
            read = 0;
            datain = 0;
            #15 rst = 1;   // De-assert reset after some delay
        end

        task WRT();
            begin
                write=0;
                read=0;
                datain=0; #20;
                write=1;
                read=0;

            repeat(8)
                begin
                     datain=$random; #10;
                end
            end
        endtask

     task RED();
        begin
         write=0;
         read=1;
         end
    endtask
    
     initial
       begin
         wait(rst==1);
            WRT();
            RED();
   // WRT_RED();
       end

    initial
        begin
  //  wait(finish==1);
            #280; $stop;
        end



    // Monitor output
    initial
        begin
         $monitor("Time=%0t | write=%b read=%b datain=%d dataout=%d empty=%b full=%b",$time, write, read, datain, dataout, empty, full);
        end

endmodule



