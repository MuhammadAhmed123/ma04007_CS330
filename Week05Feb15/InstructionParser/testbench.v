module testbench
  ();
  
  reg [31:0] ins; //input
  wire [6:0] opcode;    //outputs
  wire [4:0] rd;
  wire [2:0] func3;  
  wire [4:0] rs1;
  wire [4:0] rs2;
  wire [6:0] func7;
  
  InstructionParser my_parser(ins,opcode,rd,func3,rs1,rs2,func7);
  
  initial
  begin
  #0 ins = 32'b00000000000000000000000000000000;
  #20 ins = 32'b10000000100000001000000010000000;
  #40 ins = 32'b00010001000100010001000100010001;
  #40 ins = 32'b00000000000000000000000000000000;
  end  
  
  
  
    initial
    $monitor("Time = ", $time, " ins = %d , opcode = %d, rd = %d, func3 = %d, rs1 = %d, rs2 = %d, func7 = %d", ins, opcode, rd, func3, rs1, rs2, func7);
    
endmodule
    