module InstructionParser
  (
  input wire [31:0] ins,
  output wire [6:0] opcode,
  output wire [4:0] rd,
  output wire [2:0] func3, 
  output wire [4:0] rs1,
  output wire [4:0] rs2,
  output wire [6:0] func7
  );
  
  assign opcode = ins[6:0];
  assign rd = ins[11:7];
  assign func3 = ins[14:12];
  assign rs1 = ins[19:15];
  assign rs2 = ins[24:20];
  assign func7 = ins[31:25];
    
endmodule
  
  