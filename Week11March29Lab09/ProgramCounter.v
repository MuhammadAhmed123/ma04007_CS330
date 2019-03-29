module ProgramCounter(
	input clk, reset,
	input [63:0] PC_In,
	output reg [63:0] PC_Out
);

	initial
	PC_Out = 64'b0;

	always@ (reset, clk)
	begin
	if (reset == 1'b1)
		PC_Out <= 64'b0;
	else if (clk == 1'b1)
		PC_Out <= PC_In;	
	end
	
endmodule
