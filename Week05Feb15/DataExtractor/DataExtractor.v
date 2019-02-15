module DataExtractor
  (
  input wire [31:0] ins,
  output reg [63:0] immData
  );
  
  
  always @ ins
  if (ins[5] == 1'b1)
     immData <= {{51{ins[31]}},ins[31],ins[7],ins[30:25],ins[11:8],1'b0};           //SB-format
  /*else
    begin
      if (ins[4] == 1'b1)
        assign immData = {{52{ins[31]}},ins[31:25],ins[11:7]};      	   //S-format
      else
        assign immData = {{52{ins[31]}},ins[31:20]};    	 	   //I-format
        
      end
    */  
endmodule