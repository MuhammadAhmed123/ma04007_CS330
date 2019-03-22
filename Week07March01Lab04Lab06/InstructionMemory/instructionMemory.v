module instructionMemory(
	input [63:0] insAdd,
	output wire [31:0] ins
	);
	
	reg [7:0] memReg [15:0];		//16 8-bits memory registers
	
	integer index;
	initial
	begin
	for (index = 0; index < 16; index = index + 1)
		memReg[index] <= index;		//initializing 16 locations with arbitrary values
	end

	/*always @(insAdd)
	begin
		ins <= {memReg[insAdd[3:0]+3], memReg[insAdd[3:0]+2], memReg[insAdd[3:0]+1], memReg[insAdd[3:0]]};
	end
	*/
	assign ins = {memReg[insAdd[3:0]+3], memReg[insAdd[3:0]+2], memReg[insAdd[3:0]+1], memReg[insAdd[3:0]]};
		
endmodule