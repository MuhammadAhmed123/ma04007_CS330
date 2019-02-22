module ALU1Bit
  (
  input a,
  input b,
  input aInvert,
  input bInvert,
  input carryIn,
  input [1:0] operation,
  output reg result,
  output reg carryOut
  );
  
  wire aNew;
  assign aNew = aInvert ? ~a : a;
  
  wire bNew;
  assign bNew = bInvert ? ~b : b;
  
  always @*
  if (operation == 2'b00)
    begin
    result = aNew && bNew;
    carryOut = 1'b0;
    end
  else if (operation == 2'b01)
    begin
    result = aNew || bNew;
    carryOut = 1'b0;
    end
  else if (operation == 2'b10)
    begin
    result = (aNew & ~bNew && ~carryIn) | (~aNew & bNew & ~carryIn) | (~aNew & ~bNew & carryIn) | (aNew & bNew & carryIn);
    carryOut = (aNew & carryIn) | (bNew & carryIn) | (aNew & bNew);
    end
    
endmodule