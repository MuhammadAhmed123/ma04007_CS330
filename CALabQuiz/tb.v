module tb();

	reg [3:0] addr;
	reg [1:0] size;
	reg rd, clk, reset;
	wire [63:0] data;
	
	memory myMemory(addr, size, rd, clk, reset, data);
	
	initial		//testing code
	begin
		#0 clk = 1'b0;
		#0 rd = 1'b1;
		#0 reset = 1'b0;
		#0 addr = 4'b0100;		//address is 4, means bit 5
		#0 size = 2'b00;		//at sec=0, but first reading be done at posedge of clk, i.e. sec=5
		#10 size = 2'b01;
		#10 size = 2'b10;
		#10 size = 2'b11;
		#10 addr = 4'b1100;		//addrees is 12, means bit 13
		#0 size = 2'b11;		//wrap aorund case
		#10 rd = 1'b0;
		#0 size = 2'b10;
		#10 rd = 1'b1;
		#10 addr = 4'b1111;
		#0 size = 2'b10;		//another wrap around case when size is 4 and address is 15
		#10 reset = 1'b1;
	end
	
	always
	#5 clk = ~ clk;		//making clock
	
endmodule