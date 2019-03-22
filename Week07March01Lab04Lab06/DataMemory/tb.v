module tb(

);

    reg [63:0] memAdd, writeData;
	reg clk, memWrite, memRead;
	wire [63:0] readData;

    dataMemory myMemory(memAdd, writeData, clk, memWrite, memRead, readData);

    initial
    begin
      #0 clk = 1'b0;
      #0 memRead = 1'b1;
      #0 memWrite = 1'b0;
      #0 writeData = 64'hAAAAA;
      //debugging read operation
      #0 memAdd = 64'b0;    //sec=0, read 0th byte of memory
      #5 memAdd = 64'hA;    //sec=5, read 10th byte of memory
      #5 memAdd = 64'hF;    //sec=10, read 15th byte of memory
      #5 memRead = 1'b0;    //sec=15, closing read operations
      //debugging write operations
      #0 memAdd = 64'b0;
      #10 memWrite = 1'b1;   //sec=25, writing in 0-7th byte of memory
      #10 memAdd = 64'h10;    //sec=35, writing in 16-23th byte of memory
      #10 memAdd = 64'h8;    //sec=45, writing in 8-15th byte of memory
      #5 memAdd = 64'h8;     //sec=50, won't write in 8th byte of memory because clk negative
    end

    always
    #5 clk = ~clk;

    initial
    $monitor("Time = ",$time, " memAdd = ", memAdd, " writeData = ", writeData, " clk = ", clk, " memWrite = ", memWrite, " memRead = ", memRead, " readData = ", readData);

endmodule