module tb();

	reg [63:0] insAdd;
	wire [31:0] ins;
	
	instructionMemory insMem(insAdd, ins);
	
	initial
	begin
		#0 insAdd <= 64'b0;		//at 0 sec, ins should have memReg[3:0]
		#10 insAdd <= 64'b100; 	//at 10 sec, ins sould have memReg[7:4]
		#10 insAdd <= 64'b1000; 	//at 20 sec, ins sould have memReg[11:8]
		#10 insAdd <= 64'b1100; 	//at 30 sec, ins sould have memReg[15:12]
	end

	initial
	$monitor("Time = ", $time, " insAdd = ", insAdd, " ins = ", ins, " memReg = ", insMem.memReg);

endmodule	