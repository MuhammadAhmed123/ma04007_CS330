module tb(

);

    reg [31:0] ins;
    wire [63:0] readData1, readData2;

    top myTop(ins, readData1, readData2);

    initial
    begin
      #0 ins <= 32'b0;
      #10 ins <= 32'b00000001111011111000000000000000;  //rs2 is register 30 and rs1 is register 31
      #10 ins <= 32'b00000001110011101000000000000000;  //rs2 is register 28 and rs1 is register 29
      #10 ins <= 32'b00000000111001111000000000000000;  //rs2 is register 14 and rs1 is register 15
    end 

    initial
    $monitor("Time = ",$time, " ins = ",ins, " readData1 = ", readData1, " readData2 = ", readData2);

endmodule