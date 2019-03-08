module Adder(
	input [63:0] a, b,
	output reg [63:0] out
);
	
	//We are not making carry out signal or even we are
	//not keeping out signal of 65 bits because of assumption that
	//the values in PC counter will never grow enough large to
	//cause overflow
	
	always@ *
	begin
		out <= a+b;
	end
	
endmodule