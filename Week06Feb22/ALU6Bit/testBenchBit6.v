module testBenchBit6
  ();
  
  reg [5:0] a;
  reg [5:0] b;
  reg aInvert;
  reg bInvert;
  reg carryIn;
  reg [1:0] operation;
  wire [5:0] result;
  wire carryOut;
  
  ALU6Bit myALU6(a,b,aInvert,bInvert,carryIn,operation,result,carryOut);
  
  initial
  begin
  #0 a = 6'b000101;  
  #0 b = 6'b000010;
  #0 aInvert = 1'b0;
  #0 bInvert = 1'b0;
  #0 carryIn = 1'b0;
  #0 operation = 2'b00;     //at 0 seconds, we perform (a=000101 and b=000010)
  #10 operation = 2'b01;    //at 10 seconds, we perform (a=000101 or b=000010)
  #10 operation = 2'b10;    //at 20 seconds, we perform (a=000101 sum b=000010)
  #10 bInvert = 1'b1;
  #0 operation = 2'b10;     //at 20 seconds, we perform (a=000101 subtract b=000010)
  end
  
  initial
  $monitor("time = ",$time," a = ",a," b = ",b," aInvert = ",aInvert," bInvert = ",bInvert," carryIn = ",carryIn," operation = ",operation," result = ",result," carryOut= ", carryOut);
  
endmodule
  
  
  