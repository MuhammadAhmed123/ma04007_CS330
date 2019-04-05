module tb();
  
  reg reset, clk;
  
  processor RISCV(clk, reset); 
	
	initial
		begin
			#0 reset = 1'b0;
			#0 clk = 1'b0;
		end
		
	always
		begin
			#10 clk = ~clk;
		end
		
endmodule