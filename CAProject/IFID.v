module IFID(
	input clk,
	input [63:0] PC_Out,
	input [31:0] instruction,
	output reg [31:0] instruction_Output,
	output reg [63:0] PC_Out_Output
);

	always @(posedge clk)
	begin
		instruction_Output = instruction;
		PC_Out_Output = PC_Out;
	end
	
endmodule
