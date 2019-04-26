module ForwardingUnit(
	input [4:0] rs1, rs2, rdEX, rdMEM, regWriteEX, regWriteMEM, 
	output [1:0] ForwardA,ForwardB
);

	always @*
	begin
		if (regWriteEX && (rdEX ≠ 5'b0) && (rdEX = rs1))
			ForwardA = 2'b10;
		else if (regWriteMEM && (rdMEM ≠ 5'b0) && (rdMEM = rs1))
			ForwardA = 2'b01;
		else
			ForwardA = 2'b00;
			
		if (regWriteEX && (rdEX ≠ 5'b0) && (rdEX = rs2))
			ForwardB = 2'b10;
		else if (regWriteMEM && (rdMEM ≠ 5'b0) && (rdMEM = rs2))
			ForwardB = 2'b01;
		else
			ForwardB = 2'b00;
	end

endmodule