module mux3
(
	input [1:0] forward,
	input [63:0] a, 
	input [63:0] b, 
	input [63:0] c, 
	output reg [63:0] out
);

	always @(forward, a, b, c)
	begin
		if (forward == 2'b00)
			out = a;
		if (forward == 2'b01)
			out = b;
		if (forward == 2'b10)
			out = c;
	end

endmodule
