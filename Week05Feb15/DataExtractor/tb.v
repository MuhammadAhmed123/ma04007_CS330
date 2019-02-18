module tb
  ();
  
  reg [31:0] ins;
  wire [63:0] immData;
  
  DataExtractor myDE(ins,immData);
  
  
  initial
  begin
  #0 ins = 32'h88888888;    //I-format with sign bit 1
  #20 ins = 32'h08888888;   //I-format with sign bit 0
  #20 ins = 32'hAAAAAAAA;   //SB-format with sign bit 1
  #20 ins = 32'h0AAAAAAA;   //SB-format with sign bit 0
  #20 ins = 32'hAFAFAF91;   //S-format with sign bit 1
  #20 ins = 32'h0FAFAF91;   //S-format with sign bit 1
  end
  
  initial
  $monitor("Time = ",$time," ins = ", ins, "immData = ",immData);
  
endmodule