module tb();

	reg clk, reset;
	wire [31:0] ins;
	
	InstructionFetch insFetch(clk, reset, ins);
	
	initial
	begin
	#0 clk = 1'b0;
	#0 reset = 1'b0;
	end
	
	always
	#5 clk = ~clk;
	
	initial
	$monitor("Time = ", $time, " clk = ", clk, " reset = ", reset, " ins = ", ins, " PC_In = ", insFetch.PC_In, " PC_Out = ", insFetch.PC_Out);
	
endmodule