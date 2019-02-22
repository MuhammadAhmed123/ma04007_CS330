module ALU64Bit
  (
  input [63:0] a,
  input [63:0] b,
  input aInvert,
  input bInvert,
  input carryIn,
  input [1:0] operation,
  output reg [64:0] result,
  output reg carryOut
  );
  
  wire [64:0] aNew;
  assign aNew = aInvert ? {{1'b1},~a} : {{1'b0},a};
  
  wire [64:0] bNew;
  assign bNew = bInvert ? {{1'b1},~b} : {{1'b0},b};
  
  wire [64:0] carryIn64;
  assign carryIn64 = {{64{1'b0}},carryIn};
  
  reg [64:0] fullResult;
  
  always @*
  if (operation == 2'b00)
    begin
    result = aNew & bNew;
    carryOut = 1'b0;
    end
  else if (operation == 2'b01)
    begin
    result = aNew | bNew;
    carryOut = 1'b0;
    end
  else if (operation == 2'b10)
    begin
    fullResult = aNew + bNew + carryIn64;
    result = fullResult;
    carryOut = result[64];
    end
    
endmodule