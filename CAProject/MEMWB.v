module MEMWB(
	input regWrite, memToReg, clk
	input [63:0] read_Data, ALU_Result,
	input [4:0] rdMEM,
	output reg regWrite_Out, memToReg_Out,
	output reg [63:0] read_Data_Out, ALU_Result_Out,
	output reg [4:0] rdMEM_Out	
);

	always @ (posedge clk)
	begin
		regWrite_Out = regWrite;
		memToReg_Out = memToReg;
		read_Data_Out = read_Data;
		ALU_Result_Out = ALU_Result;
		rdMEM_Out = rdMEM;		
	end
	
endmodule