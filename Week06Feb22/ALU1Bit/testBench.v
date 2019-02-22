module testBench
  ();
  
  reg a;
  reg b;
  reg aInvert;
  reg bInvert;
  reg carryIn;
  reg [1:0] operation;
  wire result;
  wire carryOut;
  
  ALU1Bit myALU(a,b,aInvert,bInvert,carryIn,operation,result,carryOut);
  
  initial
  begin
  #0 a = 1'b1;  
  #0 b = 1'b0;
  #0 aInvert = 1'b0;
  #0 bInvert = 1'b0;
  #0 carryIn = 1'b0;
  #0 operation = 2'b00;     //at 0 seconds, we perform (a=1 and b=0)
  #10 operation = 2'b01;    //at 10 seconds, we perform (a=1 or b=0)
  #10 operation = 2'b10;    //at 20 seconds, we perform (a=1 sum b=0)
  #10 b = 1'b1;
  #0 operation = 2'b10;    //at 30 seconds, we perform (a=1 sum b=1)
  #10 carryIn = 1'b1;
  #0 operation = 2'b10;     //at 40 seconds, we perform (a=1 sum b=1 sum carryIn = 0)
  #10 aInvert = 1'b1;
  #0 bInvert = 1'b1;
  #0 operation = 2'b00;    //at 50 seconds, we perform (a=1 nor b=1)
  #10 aInvert = 1'b0;
  #0 carryIn = 1'b1;      //carryIn 1 for converting b to 2s complement
  #0 operation = 2'b10;   //at 60 seconds, we perform (a=1 subtract b=1)
  #10 a = 1'b0;
  #0 operation = 2'b10;     //at 70 seconds, we perform (a=0 subtact b=1)
  end
  
  
  initial
  $monitor("time = ",$time," a = ",a," b = ",b," aInvert = ",aInvert," bInvert = ",bInvert," carryIn = ",carryIn," operation = ",operation," result = ",result," carryOut= ", carryOut);
  
endmodule