module tb
  ();
  
  reg [31:0] ins;
  wire [63:0] immData;
  
  DataExtractor myDE(ins,immData);
  
  
  initial
  begin
  #0 ins = 32'b0;
  #10 ins = 32'b1;
  end
  
  initial
  $monitor("Time = ",$time," ins = ", ins, "immData = ",immData);
  
endmodule