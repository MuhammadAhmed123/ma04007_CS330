module processor(
	input clk, reset
);

	//part of control
	wire RegWrite, ALUSrc, MemWrite, MemToReg, MemRead, Branch, zero;
	wire [1:0] ALUOp;
	
	wire [63:0] immData;			//for immExtractor
	
	wire [63:0] PC_In, PC_Out, Value4;	//for ProgramCounter
	
	wire [31:0] instruction;		//for insMem and insParser
	
	wire [63:0] WriteData, ReadData1, ReadData2;		//for regFile
	
	wire [6:0] opcode, func7;
	wire [4:0] rd, rs1, rs2;
	wire [2:0] func3;
		
	ProgramCounter pc(clk, reset, PC_In, PC_Out);

	assign Value4 = 64'b100;
	wire [63:0] add4ToPCOut;
	
	Adder add4ToPC(PC_Out, Value4, add4ToPCOut);
		
	wire [63:0] shiftedImmData, addLabelOut;
	assign shiftedImmData = immData << 1;			//shift left by 1
	
	Adder addLabel(PC_Out, shiftedImmData, addLabelOut);
	
	wire PCSrc;
	assign PCSrc = Branch & zero;
	
	MUX PCSrcMUX(add4ToPCOut, addLabelOut, PCSrc, PC_In);
	
	instructionMemory insMem(PC_Out, instruction);
		
	InstructionParser insParser(instruction, opcode, rd, func3, rs1, rs2, func7);
	
	controlUnit control(opcode, Branch, MemRead, MemToReg, MemWrite, ALUSrc, RegWrite, ALUOp);
				
	registerFile regFile(WriteData, rs1, rs2, rd, clk, reset, RegWrite, ReadData1, ReadData2);
	
	ImmediateGenerator immExtractor(instruction, immData);
	
	wire [3:0] funct;
	assign funct = {instruction[30], instruction[14:12]};
	
	wire [3:0] operation;
	
	ALUControl ALUController(ALUOp, funct, operation);
	
	//ALU part of processor
	
	wire [63:0] ALUSrcMUXOut;
	
	MUX ALUSrcMUX(ReadData2, immData, ALUSrc, ALUSrcMUXOut);
	
	wire carryOut;		//un-utilized
	wire [63:0] ALUResult;
	
	ALU64Bit ALU(ReadData1, ALUSrcMUXOut, operation[2], operation, ALUResult, zero, carryOut);
	
	wire [63:0] dataMemoryOut;
	
	dataMemory dataMem(ALUResult, ReadData2, clk, MemWrite, MemRead, dataMemoryOut);
	
	MUX MemToRegMUX(ALUResult, dataMemoryOut, MemToReg, WriteData);
	
	
endmodule
	
	
	