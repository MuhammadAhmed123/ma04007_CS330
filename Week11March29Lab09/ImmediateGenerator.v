module ImmediateGenerator
  (
  input [31:0] ins,
  output reg [63:0] immData
  );
  
  //
  //need to be verified
  //
  
  always @ (ins)
  begin
  if (ins[5] == 1'b1)
     immData = {{51{ins[31]}},ins[31],ins[7],ins[30:25],ins[11:8],1'b0};           //SB-format
  else
    begin
      if (ins[4] == 1'b1)
        immData = {{52{ins[31]}},ins[31:25],ins[11:7]};      	   //S-format
      else
        immData = {{52{ins[31]}},ins[31:20]};    	 	   //I-format
    end
  end
    
endmodule