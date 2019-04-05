module ALUControl(
	input [1:0] ALUOp,
	input [3:0] func,
	output reg [3:0] operation
);

	initial
		operation = 4'b1111;		//because there is no such value of operation but 0000 is.
		
	always @ (ALUOp, func)
		begin
			case (ALUOp)
				2'b00: operation = 4'b0010;
				2'b01: operation = 4'b0110;
				2'b10: begin
							case (func)
								4'b0000: operation = 4'b0010;
								4'b1000: operation = 4'b0110;
								4'b0111: operation = 4'b0000;
								4'b0110: operation = 4'b0001;
							endcase
						end
			endcase
		end
		
endmodule