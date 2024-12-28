
/* `timescale 1ns/1ps

module learn1_tb;

	reg in_a, in_b;
	wire sum, carry;

	// Instantiate the learn1 module
	learn1 uut (.s(sum), .c(carry), .a(in_a), .b(in_b));
	
	initial 
	begin
		in_a = 1'b0;
		in_b = 1'b0;
		
		#2 in_a = 1'b1;
		in_b = 1'b0;
		
		#2 in_a = 1'b1;
		in_b = 1'b1;
		
		#2 in_a = 1'b0;
		in_b = 1'b1;
	end

	initial $monitor("time=%g, a=%b, b=%b, sum=%b, carry=%b", $time, in_a, in_b, sum, carry);

	initial #10 $finish;

endmodule */

`timescale 1ns/1ps

module learn1_tb;
	
	reg in_a, in_b;

	wire sum, carry;
	
	//learn1 uut (.sum(s), .carry(c), .in_a(a), .in_b(b)); 
	learn1 uut (.s(sum), .c(carry), .a(in_a), .b(in_b));
	
	initial 
	begin
		in_a = 1'b0;
		in_b = 1'b0;
		
		#2 in_a = 1'b1;
		in_b = 1'b0;
		
		#2 in_a = 1'b1;
		in_b = 1'b1;
		
		#2 in_a = 1'b0;
		in_b = 1'b1;
	end

	initial $monitor("time=%g, a=%b, b=%b, sum = %b, carry=%b", $time, in_a, in_b, sum, carry);


	//initial #10 $finish;

endmodule
