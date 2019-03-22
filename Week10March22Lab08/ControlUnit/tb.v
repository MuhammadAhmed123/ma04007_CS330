module tb();

	reg [6:0] opcode;
	wire branch, memRead, memToReg, memWrite, ALUSrc, regWrite;
	wire [1:0] ALUOp;
	
	controlUnit unit(opcode, branch, memRead, memToReg, memWrite, ALUSrc, regWrite, ALUOp);
	
	initial
		begin
			#0 opcode = 7'b0;		//at sec=0, opcode is 0; so no changes
			#5 opcode = 7'b0110011;
			#5 opcode = 7'b0000011;
			#5 opcode = 7'b0100011;
			#5 opcode = 7'b1100011;
			//repeating
			#5 opcode = 7'b0110011;
			#5 opcode = 7'b0000011;
			#5 opcode = 7'b0100011;
			#5 opcode = 7'b1100011;
		end
		
	initial
	$monitor("Time = ", $time, " opcode = ", opcode, " ALUSrc = ", ALUSrc, " memToReg = ", memToReg, " regWrite = ", regWrite, " memRead = ", memRead, " memWrite = ", memWrite, "branch = ", branch, "ALUOp = ", ALUOp);
			
endmodule		
			
			