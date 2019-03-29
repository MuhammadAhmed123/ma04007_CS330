module MUX
  (
  input [63:0] qin01,
  input [63:0] qin02,
  input sel,
  output reg [63:0] qout
  );
  
  always @(sel or qin01 or qin02)
    if (sel)
      qout <= qin02;
    else
      qout <= qin01;
  
endmodule
  