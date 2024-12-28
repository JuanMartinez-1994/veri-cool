`timescale 1ns/1ps

module learn1 (s, c, a, b);

	input a, b; 
	output s, c;
	
	assign s = (a^b);
	assign c = (a&b);

endmodule 
