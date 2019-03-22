module topControl(
	input [6:0] opcode,
	input [3:0] func,
	output branch, memRead, memToReg, memWrite, ALUSrc, regWrite,
	output [3:0] operation
);
	
	wire [1:0] ALUOp;
	
	controlUnit cu(opcode, branch, memRead, memToReg, memWrite, ALUSrc, regWrite, ALUOp);
	
	ALUControl ac(ALUOp, func, operation);
	
endmodule
	
	
	