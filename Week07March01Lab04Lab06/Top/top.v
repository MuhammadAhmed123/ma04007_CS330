module top(
    input [31:0] ins,
    output [63:0] readData1, readData2
);

    wire [6:0] opcode;
    wire [4:0] rd;
    wire [2:0] func3;
    wire [4:0] rs1;
    wire [4:0] rs2;
    wire [6:0] func7;

    wire [63:0] WriteData;
    wire clk, reset, RegWrite; 
	
	assign reset = 1'b0;

    InstructionParser myParser(ins, opcode, rd, func3, rs1, rs2, func7);

    registerFile myFile(WriteData, rs1, rs2, rd, clk, reset, RegWrite, readData1, readData2);

endmodule