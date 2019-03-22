module tb();

	reg [1:0] ALUOp;
	reg [3:0] func;
	wire [3:0] operation;
	
	ALUControl ac(ALUOp, func, operation);
	
	initial
		begin
			#0 ALUOp = 2'b11;		//nothing will happen at sec=0
			#0 func = 4'b1111;
			#5 ALUOp = 2'b00;		//values will change at sec=5
			#5 func = 4'b0001;		//values will remain same at sec=10
			#5 ALUOp = 2'b01;		
			#5 ALUOp = 2'b10;		//nothing will happen because of func at sec=20
			#5 func = 4'b0000;		//sec 25
			#5 func = 4'b1000;
			#5 func = 4'b0111;
			#5 func = 4'b0110;		//sec=40
		end
		
	initial
	$monitor("Time = ", $time, " ALUOp = ", ALUOp, " func = ", func, " operation = ", operation);

endmodule