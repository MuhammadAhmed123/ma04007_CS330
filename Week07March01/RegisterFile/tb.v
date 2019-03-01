module tb();
	
	//registers to connect with inputs
	reg [63:0] WriteData;
	reg [4:0] RS1, RS2, RD;
	reg clk, reset, RegWrite;
	
	//wires to connect with output
	wire [63:0] ReadData1, ReadData2;
	
	registerFile myFile(WriteData, RS1, RS2, RD, clk, reset, RegWrite, ReadData1, ReadData2);
	
	//initializing all input to 0
	initial
	begin
		#0 clk = 1'b0;
		#0 reset = 1'b1;
		#0 RegWrite = 1'b0;
		#0 RS1 = 5'b0;
		#0 RS2 = 5'b0;
		#0 RD = 5'b0;
		#0 WriteData = 64'b0;
	end
	
	//making clk a clock with frequency of 10 seconds
	always
	#5 clk = ~clk;
	
	initial
	begin
		//debugging write data part
		#10 WriteData = 64'hAAAAA;	//at 10 seconds
		#0 RegWrite = 1'b1;    //reg write positive but won't write becasue RD = 0
		#5 RD = 5'b1;           //at 15 seconds first registers will be overwritten
		#5 RegWrite = 1'b0;   //20 seconds
		#0 RD = 5'hA;      //11th register won't be written because reg write is 0
		#3 RegWrite = 1'b1;   //23 seconds, still 10th register will not be written		because clk is 0 but at 25th seconds it will be written
		//debugging read data part
		//currently at uptill now we are reading values of 0 register because RS1 and RS2 are 0
		#2 reset = 1'b0;
		#5 RS1 = 5'b1;      //at 30 seconds, read value of 1st register
		#5 RS2 = 5'hA;      //at 35 seconds, read value of 11th register
		#5 reset = 1'b1;     // at 40 seconds, we reset
		#5 reset = 1'b0;      //at 45 seconds, we start reading values again of 1st and 11th register
	end
	
	initial
	$monitor("Time = ", $time, " clk = ", clk, " reset = ", reset, " RegWrite = ", RegWrite, " RS1 = ", RS1, " ReadData1 = ", ReadData1," ReadData2 = ", ReadData2," RS2 = ", RS2, " RD = ", RD, " WriteData = ", WriteData, " Registers[0] = ", myFile.Registers[0], " Registers[1] = ", myFile.Registers[1], " Registers[10] = ", myFile.Registers[10]);    //, " Registers = ", myFile.Registers
	
	
endmodule