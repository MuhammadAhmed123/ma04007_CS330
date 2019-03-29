module dataMemory(
	input [63:0] memAdd, writeData,
	input clk, memWrite, memRead,
	output reg [63:0] readData
	);

	reg [7:0] memData [63:0];		// 64 8-bit memory segments

	integer index;
	
	//initializing with values
	initial
	begin
		for (index = 0; index < 64; index = index + 1)
			memData[index] <= index;
	end
	
	
	always @(memAdd, memRead)
	begin
		if (memRead)
			readData <= {memData[memAdd[5:0]+7], memData[memAdd[5:0]+6], memData[memAdd[5:0]+5], memData[memAdd[5:0]+4], memData[memAdd[5:0]+3], memData[memAdd[5:0]+2], memData[memAdd[5:0]+1], memData[memAdd[5:0]]};
	end
	
	
	//assign readData = {memData[memAdd[5:0]+7], memData[memAdd[5:0]+6], memData[memAdd[5:0]+5], memData[memAdd[5:0]+4], memData[memAdd[5:0]+3], memData[memAdd[5:0]+2], memData[memAdd[5:0]+1], memData[memAdd[5:0]]};

	integer i;

	always @(posedge clk)
	begin
		if (memWrite)
			for (i = 0; i < 8; i = i + 1)
				memData[i + memAdd[5:0]] <= writeData[{{8*i}+7} -: 8];	//memData[{7 + i + memAdd[5:0]}:{i + memAdd[5:0]}] <= writeData[{7 + i}:{i}];
	end

endmodule
