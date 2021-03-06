module testBenchBit64
  ();
  
  reg [63:0] a;
  reg [63:0] b;
  reg aInvert;
  reg bInvert;
  reg carryIn;
  reg [1:0] operation;
  wire [64:0] result;
  wire carryOut;
  
  ALU64Bit myALU64(a,b,aInvert,bInvert,carryIn,operation,result,carryOut);
  
  initial
  begin
  #0 a = 64'b101;  
  #0 b = 64'b10;
  #0 aInvert = 1'b0;
  #0 bInvert = 1'b0;
  #0 carryIn = 1'b0;
  #0 operation = 2'b00;     //at 0 seconds, we perform (a=000101 and b=000010)
  #10 operation = 2'b01;    //at 10 seconds, we perform (a=000101 or b=000010)
  #10 operation = 2'b10;    //at 20 seconds, we perform (a=000101 sum b=000010)
  #10 bInvert = 1'b1;
  #0 carryIn = 1'b1;        //for converting b to 2s complement
  #0 operation = 2'b10;     //at 20 seconds, we perform (a=000101 subtract b=000010)
  #10 bInvert = 1'b0;
  #0 aInvert = 1'b1;
  #0 operation = 2'b10;       //at 30 seconds, we perform (a=-5 add b=2)
  end
  
  initial
  $monitor("time = ",$time," a = ",a," b = ",b," aInvert = ",aInvert," bInvert = ",bInvert," carryIn = ",carryIn," operation = ",operation," result = ",result," carryOut= ", carryOut);
  
endmodule
  