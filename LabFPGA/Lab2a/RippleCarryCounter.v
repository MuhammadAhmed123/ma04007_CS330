module RippleCarryCounter(clock, reset, qoutput);
  
  input clock, reset;
  output [3:0] qoutput;
  
wire div_clk;

	clock_divider CD0
	(
		.clock_n(clock),
		.reset_p(reset),
		.div_clk(div_clk)
	);
  
  T_FF tff0(div_clk, reset, qoutput[0]);
  
  T_FF tff1(qoutput[0], reset, qoutput[1]);
  
  T_FF tff2(qoutput[1], reset, qoutput[2]);
  
  T_FF tff3(qoutput[2], reset, qoutput[3]);  
  
endmodule