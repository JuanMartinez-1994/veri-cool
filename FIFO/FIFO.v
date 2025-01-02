
`timescale 1ns/1ps 

module FIFO (
	input CLK, 
	input [7:0] WriteData, // data i want to write
	input WEN, 				// hi if i want to write
	input REN,             // hi if i want to read
	output reg [7:0] ReadData);  // data i am reading ADDED REG 
	
	reg [7:0] FIFO [7:0]; //reg [7:0] FIFO [2:0];  //8 slots
	reg [3:0] WP = 4'b0000;//4bit, 16 possible 0-16 "0000 Empty -> 1000 Full"
	reg [3:0] RP = 4'b0000;//4bit, 16 possible 0-16 "0000 Empty -> 1000 Full"
	
	always@(posedge CLK)
	begin
		if (WEN && !(WP == {~RP[3], RP[2:0]}))
		//if (WEN && !( {~WP[3],WP[2:0]} == RP))
		begin
			FIFO[WP[2:0]] <= WriteData; // Write to the FIFO , FIFO [WP] <= WriteData;
			WP <= WP + 1;
			// WEN <= 0;
		end
//	end
//	always@(posedge CLK)
//	begin
		if (REN &&  !(WP == RP))
		begin 
			ReadData <= FIFO[RP[2:0]]; //ReadData <= FIFO [RP];
			RP <= RP + 1;
			//REN <= 0;
		end
	end	
endmodule





/*

type [size] y [row][column];
reg        y1 [11:0];        // y is an scalar reg array of depth=12, each 1-bit wide
wire [0:7] y2 [3:0]          // y is an 8-bit vector net with a depth of 4
reg  [7:0] y3 [0:1][0:3];    // y is a 2D array rows=2,cols=4 each 8-bit wide
*/