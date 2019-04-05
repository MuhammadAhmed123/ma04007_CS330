module registerFile(
	input [63:0] WriteData,
	input [4:0] RS1, RS2, RD,
	input clk, reset, RegWrite,
	output wire [63:0] ReadData1, ReadData2
	);
	
	reg [63:0] Registers [31:0];		//array of 64-bit registers
	
	integer index;
	initial
	begin
	for (index = 0; index < 32; index = index + 1)
		if (index == 1)
			Registers[index] <= 64'b1;
		else if (index == 21)
			Registers[index] <= 64'b10;
		else
			Registers[index] <= 64'b0;		//Registers[index] <= 64'd{index};    //assigning all of registers zero for testing purpose
	end
	
	always @(posedge clk)
	begin
		if (RegWrite == 1'b1 && RD != 5'b0)
			Registers[RD] <= WriteData;
	end
	
	/*
	always @(RS1, RS2, reset)
	begin
		if (reset == 1'b1)
			begin
				ReadData1 <= 64'b0;
				ReadData2 <= 64'b0;
			end
		else
			begin
				ReadData1 <= Registers[RS1];
				ReadData2 <= Registers[RS2];
			end
	end
	*/
	
	assign ReadData1 = reset ? 64'b0:Registers[RS1];
	assign ReadData2 = reset ? 64'b0:Registers[RS2];
	
	
	
endmodule