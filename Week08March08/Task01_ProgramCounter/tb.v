module tb();

	reg clk, reset;
	reg [63:0] PC_In;
	wire [63:0] PC_Out;
	
	ProgramCounter myCounter(clk, reset, PC_In, PC_Out);
	
	initial
	begin
	#0 clk = 1'b0;
	#0 reset = 1'b1;
	#0 PC_In = 64'hAAAA;	//OUTPUT WOULD BE 0 BECAUSE RESET IS HIGH
	#10 reset = 1'b0;		//OUTPUT STILL 0 BECAUSE CLK IS DOWN
	#10 reset = 1'b1;   //OUTPUT WILL FALL TO 0
	end
	
	always
	#5 clk = ~clk;
	
endmodule