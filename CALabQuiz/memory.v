module memory(
	input wire [3:0] addr,
	input wire [1:0] size,
	input wire rd, clk, reset,
	output reg [63:0] data
);
	
	initial
	data = 64'b0;		//initial output is 0, i.e. as the program starts
	
	reg [7:0] mem [15:0];		//array of 16 8-bit registers
	
	integer index;
	initial
	begin
		for (index = 0; index < 16; index = index + 1)
			mem[index] = index;			//initial assignment
	end
	
	integer i;
	always @(reset)
	begin
		if (reset == 1'b1)
		begin
			for (i = 0; i < 16; i = i + 1)
				mem[i] = 8'b0;
		end
	end
	
	always @(posedge clk)
	begin
		if (rd == 1'b1)
		begin
			case (size)
				2'b00 : data = {{56{1'b0}},mem[addr]};
				2'b01 : data = {{48{1'b0}},mem[(addr+1)%16],mem[addr]};
				2'b10 : data = {{32{1'b0}},mem[(addr+3)%16],mem[(addr+2)%16],mem[(addr+1)%16],mem[addr]};
				2'b11 : data = {mem[(addr+7)%16],mem[(addr+6)%16],mem[(addr+5)%16],mem[(addr+4)%16],mem[(addr+3)%16],mem[(addr+2)%16],mem[(addr+1)%16],mem[addr]};
			endcase
		end
	end
	
endmodule