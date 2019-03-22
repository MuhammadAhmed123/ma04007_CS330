module tb();

	reg [6:0] opcode;
	reg [3:0] func;
	wire branch, memRead, memToReg, memWrite, ALUSrc, regWrite;
	wire [3:0] operation;
	
	topControl myTopControl(opcode, func, branch, memRead, memToReg, memWrite, ALUSrc, regWrite, operation);
	
	initial
	begin
	#0 opcode = 7'b1111111;
	#0 func = 4'b1111;			//nothing will happen because both of them are not legal inputs
	#5 opcode = 7'b0110011;		//at sec=5 ALUOp = 10, [operation will be by default 1111 because no legal ALUOp will be generated]
	//checking all 4 cases with func
	#5 func = 4'b0000;		//sec =10
	#5 func = 4'b1000;		//sec =15
	#5 func = 4'b0111;		//sec =20
	#5 func = 4'b0110;		//sec =25
	#5 opcode = 7'b0000011;		//at sec = 30 ALUOp = 00
	#5 opcode = 7'b0100011;		//at sec = 35 ALUOp = 00
	#5 opcode = 7'b1100011;		//at sec = 40 ALUOp = 01
	end
	
	initial
	$monitor("Time = ", $time, " opcode = ", opcode, " func = ", func, " ALUSrc = ", ALUSrc, " memToReg = ", memToReg, " regWrite = ", regWrite, " memRead = ", memRead, " memWrite = ", memWrite, "branch = ", branch, " operation = ", operation);
	
endmodule