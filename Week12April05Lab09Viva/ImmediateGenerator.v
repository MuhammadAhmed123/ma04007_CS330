module ImmediateGenerator
  (
  input [31:0] ins,
  output reg [63:0] immData
  );
  
  //
  //needs to be verified
  //
  
  always @ (ins)
  begin
  if (ins[6] == 1'b1)     //which bit is 6th ins[5] or ins[6]
     immData = {{51{ins[31]}},ins[31],ins[7],ins[30:25],ins[11:8],1'b0};           //SB-format
  else
    begin
      if (ins[5] == 1'b1)     //which bit is 5th ins[5] or ins[4]
        immData = {{52{ins[31]}},ins[31:25],ins[11:7]};      	   //S-format
      else
        immData = {{52{ins[31]}},ins[31:20]};    	 	   //I-format
    end
  end
    
endmodule