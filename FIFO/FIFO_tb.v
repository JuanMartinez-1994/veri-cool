`timescale 1ns/1ps 

module FIFO_tb;
	reg WE, RE;
	reg [7:0] WD;
	reg clk;
	wire [7:0] RD; // wire cause im trying to bring it back

FIFO UUT (.CLK(clk), .WriteData(WD), .WEN(WE), .REN(RE), .ReadData(RD));

always #5 clk <= ~clk;

//initialize wrong
	initial
	begin
		// Initialize
		#10 
		clk = 0;
		WE = 0;
		RE = 0;
		WD = 1'b0;
		
		//Write data
		#10
		WE = 1; 
		WD = 8'b1111_0000;
		#10 
		WE = 0;
		#10 
		WE = 1; 
		WD = 8'b0000_1111;
		#10
		WE = 0;
		#10 
		WE = 1; 
		WD = 8'b1100_1100;
		#10
		WE = 0;
		#10 
		WE = 1; 
		WD = 8'b0011_0011;
		#10
		WE = 0;
		#10 
		WE = 1; 
		WD = 8'b1111_1111;
		#10
		WE = 0;
		#10
		WE = 1; 
		WD = 8'b0110_0110;
		#10
		WE = 0;
		#10
		WE = 1; 
		WD = 8'b0000_0000;
		#10
		WE = 0;
		#10
		WE = 1; 
		WD = 8'b1001_1001;
		#10
		WE = 0;
		#10 // Should be full here
		WE = 1; 
		WD = 8'b1010_1010;
		#10
		WE = 0; 
		WD = 8'bXXXX_XXXX;
		
		// Read Data
		RE = 1; 
		#10
		RE = 0;
		#10
		RE = 1;
		#10
		RE = 0;
		#10
		RE = 1;
		#10
		RE = 0;
		#10
		RE = 1;
		#10
		RE = 0;
		#10
		RE = 1;
		#10
		RE = 0;
		#10
		RE = 1;
		#10
		RE = 0;
		#10
		RE = 1;
		#10
		RE = 0;
		#10
		RE = 1;
		#10
		RE = 0;
		#10 // Should be empty here
		RE = 1;
		#10
		RE = 0;
		
		
		//Write and read two more
		#10
		WE = 1; 
		WD = 8'b1101_0000;
		#10 
		WE = 0;
		#10 
		WE = 1; 
		WD = 8'b0000_1101;
		
		RE = 1;
		#10
		RE = 0;
		#10
		RE = 1;
		#10
		RE = 0;
		
		$finish
	end

	initial
	begin 
		$monitor("time=%d, REN=%b, WEN=%b, WriteData=%b, ReadData=%b", $time, RE, WE, WD, RD);
	end

endmodule 