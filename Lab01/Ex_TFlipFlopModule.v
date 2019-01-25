module T_FF(clk, re, qout);
  
    input clk, re;
    output qout;
  
  
  wire data;
  
  //Now we will make an object of D_FF inside this module
  D_FF dff0(clk, re, data, qout);
  
  not n1(data,qout);
  
endmodule