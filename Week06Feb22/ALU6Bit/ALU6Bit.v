module ALU6Bit
  (
  input [5:0] a,
  input [5:0] b,
  input aInvert,
  input bInvert,
  input carryIn,
  input [1:0] operation,
  output wire [5:0] result,
  output wire carryOut  
  );
  
  wire carryOut01,carryOut02,carryOut03,carryOut04,carryOut05;
  
  ALU1Bit ALU1Bit01(a[0],b[0],aInvert,bInvert,carryIn,operation,result[0],carryOut01);

  ALU1Bit ALU1Bit02(a[1],b[1],aInvert,bInvert,carryOut01,operation,result[1],carryOut02);

  ALU1Bit ALU1Bit03(a[2],b[2],aInvert,bInvert,carryOut02,operation,result[2],carryOut03);

  ALU1Bit ALU1Bit04(a[3],b[3],aInvert,bInvert,carryOut03,operation,result[3],carryOut04);

  ALU1Bit ALU1Bit05(a[4],b[4],aInvert,bInvert,carryOut04,operation,result[4],carryOut05);

  ALU1Bit ALU1Bit06(a[5],b[5],aInvert,bInvert,carryOut05,operation,result[5],carryOut);
  
endmodule  