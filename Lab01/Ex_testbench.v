module tb
  (
  
  );
  
    reg clock;
    reg reset;
    wire [4:0] q;
    
    RippleCarryCounter r1(clock, reset, q);
    
    initial
    clock = 1'b0;
    
    always
    #5 clock = ~clock;
    
    initial
    begin
      reset = 1'b1;
      #15 reset = 1'b0;
      #500 reset = 1'b1;
    end
    
    initial
    $monitor("Time = ", $time, "---> Output = %d", q);
    
endmodule
  
    
  