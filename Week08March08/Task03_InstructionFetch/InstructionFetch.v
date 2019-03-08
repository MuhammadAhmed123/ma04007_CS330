module InstructionFetch(
	input clk, 
	input reset,
	output [31:0] ins
);
	
	wire [63:0] PC_Out, In4, PC_In;
	
	assign In4 = 64'b100;	//assigning 4

	ProgramCounter PC(clk, reset, PC_In, PC_Out);	

	Adder Add(PC_Out, In4, PC_In);
	
	instructionMemory Mem(PC_Out, ins);
	
endmodule
