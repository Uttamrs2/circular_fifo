`timescale 1ns / 1ps

module fifo_tb;

reg clk;
reg rst_n;
reg wr;
reg rd;
reg [7:0] data_in;

wire [7:0] data_out;
wire fifo_full;
wire fifo_empty;
wire fifo_threshold;
wire fifo_overflow;
wire fifo_underflow;


fifo_mem dut (
    .data_out(data_out),
    .fifo_full(fifo_full),
    .fifo_empty(fifo_empty),
    .fifo_threshold(fifo_threshold),
    .fifo_overflow(fifo_overflow),
    .fifo_underflow(fifo_underflow),
    .clk(clk),
    .rst_n(rst_n),
    .wr(wr),
    .rd(rd),
    .data_in(data_in)
);


initial begin
    clk = 0;
    forever #5 clk = ~clk;
end


initial begin
    rst_n   = 0;
    wr      = 0;
    rd      = 0;
    data_in = 0;

  
    $monitor("T=%0t | wr=%b rd=%b data_in=%h data_out=%h | full=%b empty=%b thresh=%b ovf=%b udf=%b",
              $time, wr, rd, data_in, data_out,
              fifo_full, fifo_empty, fifo_threshold,
              fifo_overflow, fifo_underflow);

    
    #10 rst_n = 1;

    
    #10;
    repeat(17) begin         
        #10 wr = 1;
            data_in = data_in + 1;
        #10 wr = 0;
    end

   -
    #20;
    repeat(17) begin      
        #10 rd = 1;
        #10 rd = 0;
    end

  
    #50 $finish;
end

endmodule
