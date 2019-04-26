module IDEX(
	input clk,
	input [63:0] readData1, readData2, PC_Out, imm_Data,
	input [4:0] rs1, rs2, rd,
	input [3:0] funct,
	input branch, memRead, memToReg, memWrite, ALUSrc, regWrite,
	input [1:0] ALUOp,
	output reg [63:0] readData1_Out, readData2_Out, PC_Out_Out, imm_Data_Out,
	output reg [4:0] rs1_Out, rs2_Out, rd_Out,
	output reg [3:0] funct_Out,
	output reg branch_Out, memRead_Out, memToReg_Out, memWrite_Out, ALUSrc_Out, regWrite_Out,
	output reg [1:0] ALUOp_Out	
);

	always @ (posedge clk)
	begin
		readData1_Out = readData1;
		readData2_Out = readData2;
		PC_Out_Out = PC_Out;
		imm_Data_Out = imm_Data;
		rs1_Out = rs1;
		rs2_Out = rs2;
		rd_Out = rd;
		funct_Out = funct;
		branch_Out = branch;
		memRead_Out = memRead;
		memToReg_Out = memToReg;
		memWrite_Out = memWrite;
		ALUSrc_Out = ALUSrc;
		regWrite_Out = regWrite;
		ALUOp_Out = ALUOp;
	end
	
endmodule