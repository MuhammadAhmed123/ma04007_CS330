module instructionMemory(
	input [63:0] insAdd,
	output [31:0] ins
	);
	
	reg [7:0] memReg [15:0];		//16 8-bits memory registers
	
	/*
	integer index;
	initial
	begin
	for (index = 0; index < 16; index = index + 1)
		memReg[index] <= index;		//initializing 16 locations with arbitrary values
	end
	*/
	
	initial
	begin
	memReg[0] = 8'b10000011;
	memReg[1] = 8'b00110100;
	memReg[2] = 8'b10000101;
	memReg[3] = 8'b00000010;
	memReg[4] = 8'b10110011;
	memReg[5] = 8'b10000100;
	memReg[6] = 8'b10011010;
	memReg[7] = 8'b00000000;
	memReg[8] = 8'b10110011;
	memReg[9] = 8'b10000100;
	memReg[10] = 8'b00010100;
	memReg[11] = 8'b00000000;
	memReg[12] = 8'b00100011;
	memReg[13] = 8'b00110100;
	memReg[14] = 8'b10010101;
	memReg[15] = 8'b00000010;
	end	
	
	assign ins = {memReg[insAdd[3:0]+3], memReg[insAdd[3:0]+2], memReg[insAdd[3:0]+1], memReg[insAdd[3:0]]};

		
endmodule