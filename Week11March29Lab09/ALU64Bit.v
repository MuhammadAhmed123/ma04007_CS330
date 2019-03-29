module ALU64Bit
  (
  input [63:0] a,
  input [63:0] b,
  input carryIn,
  input [3:0] op,
  output reg [63:0] result,
  output reg zero, carryOut
  );
  
  wire aInvert, bInvert;
  assign aInvert = op[3];
  assign bInvert = op[2];
  
  wire [1:0] operation;
  
  //---
  assign operation = op[1:0];     //need to be checked		//resolved
  //---
    
  initial
  zero = 1'b0;
  
  wire [64:0] aNew;
  assign aNew = aInvert ? {{1'b1},~a} : {{1'b0},a};
  
  wire [64:0] bNew;
  assign bNew = bInvert ? {{1'b1},~b} : {{1'b0},b};
  
  wire [64:0] carryIn64;
  assign carryIn64 = {{64{1'b0}},carryIn};
  
  reg [64:0] fullResult;
  
  always @*
  begin
  if (operation == 2'b00)
    begin
    fullResult = aNew & bNew;
    carryOut = 1'b0;
	end
  else if (operation == 2'b01)
    begin
    fullResult = aNew | bNew;
    carryOut = 1'b0;
    end
  else if (operation == 2'b10)
    begin
    fullResult = aNew + bNew + carryIn64;
	carryOut = fullResult[64];
    end
	end
	
	always @*
	begin
	result = fullResult[63:0];
	if (result || 64'b0 == 64'b0)
		zero = 1'b1;
	else
		zero = 1'b0;
	end
    
	
    
endmodule