module EXMEM(
	input branch, memRead, memToReg, memWrite, regWrite, zero, clk
	input [63:0] label, mem_Addr, Write_Data,
	input [4:0] rdEX,
	output reg branch_Out, memRead_Out, memToReg_Out, memWrite_Out, regWrite_Out, zero_Out
	output reg [63:0] label_Out, mem_Addr_Out, Write_Data_Out,
	output reg [4:0] rdEX_Out	
);

	always @(posedge clk)
	begin
		branch_Out = branch;
		memRead_Out = memRead;
		memToReg_Out = memToReg;
		memWrite_Out = memWrite;
		regWrite_Out = regWrite;
		zero_Out = zero;
		label_Out = label;
		mem_Addr_Out = mem_Addr;
		Write_Data_Out = Write_Data;
		rdEX_Out = rdEX;
	end
	
endmodule