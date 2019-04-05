module controlUnit(
	input [6:0] opcode,
	output reg branch, memRead, memToReg, memWrite, ALUSrc, regWrite,
	output reg [1:0] ALUOp
);

	initial
		begin
			branch = 1'b0;
			memRead = 1'b0;
			memToReg = 1'b0;
			memWrite = 1'b0;
			ALUSrc = 1'b0;
			regWrite = 1'b0;
			ALUOp = 2'b11;		//because this is not a legal output of ALUOp
		end
		
	always @ (opcode)
		begin
			case (opcode)
				7'b0110011 : {ALUSrc, memToReg, regWrite, memRead, memWrite, branch, ALUOp} = 8'b00100010;				
				7'b0000011 : {ALUSrc, memToReg, regWrite, memRead, memWrite, branch, ALUOp} = 8'b11110000;				
				7'b0100011 : {ALUSrc, memToReg, regWrite, memRead, memWrite, branch, ALUOp} = 8'b10001000;				
				7'b1100011 : {ALUSrc, memToReg, regWrite, memRead, memWrite, branch, ALUOp} = 8'b00000101;				
			endcase
		end
		
endmodule
			

	