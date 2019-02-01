module testbench
  ();
  
  reg [63:0] q01;
  reg [63:0] q02;
  reg sel;
  wire [63:0] qout;
  
  MUX my_mux(q01,q02,sel,qout);
  
  initial
  begin
  sel = 1'b0;
  #15 q02 = 64'hAA;
  end
  
  always
  #10 sel = ~sel;
  
  initial
  begin
    q01 = 64'hFF;
    q02 = 64'hA;
  end
  
  initial
  $monitor("Time = ", $time, " At selector = %d, qout = %d", sel, qout);
  
endmodule