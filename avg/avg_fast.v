`timescale 1ns / 1ps


module add_8_9(a,b,out);
	input [7:0] a;
	input [7:0] b;
	output[8:0] out;
	assign out = a+b;
endmodule

module add_9_10(a,b,out);
	input [8:0] a;
	input [8:0] b;
	output[9:0] out;
	assign out = a+b;
endmodule

module add_10_11(a,b,out);
	input [9:0] a;
	input [9:0] b;
	output[10:0] out;
	assign out = a+b;
endmodule

module avg( 
    num_in, 
    clk,
    rs,
    ave8
  ) ;
  input clk ;
  input rs;
  input [7:0] num_in ;
  output [7:0] ave8 ;
  reg [7:0] registers [7:0] ;

  wire [8:0] a;
  wire [8:0]b;
  wire [8:0]c;
  wire [8:0]d;
  wire [9:0]e;
  wire [9:0]f;
  wire [10:0]g;

	add_8_9 a_1(
		.a(registers[0]),
		.b(registers[1]),
		.out(a)
	);
	
	add_8_9 b_1(
		.a(registers[2]),
		.b(registers[3]),
		.out(b)
	);
	
	add_8_9 c_1(
		.a(registers[4]),
		.b(registers[5]),
		.out(c)
	);
	
	add_8_9 d_1(
		.a(registers[6]),
		.b(registers[7]),
		.out(d)
	);
	
	add_9_10 a_2(
		.a(a),
		.b(b),
		.out(e)
	);
	
	add_9_10 b_2(
		.a(c),
		.b(d),
		.out(f)
	);
	
	add_10_11 a_3(
		.a(e),
		.b(f),
		.out(g)
	);

	
  initial begin
    registers[0] <= 0;
    registers[1] <= 0;
    registers[2] <= 0;
    registers[3] <= 0;
    registers[4] <= 0;
    registers[5] <= 0;
    registers[6] <= 0;
    registers[7] <= 0;	 
  end

  always @(posedge clk) begin
      
		if(rs) begin
		 registers[0] <= 0;
		 registers[1] <= 0;
		 registers[2] <= 0;
		 registers[3] <= 0;
		 registers[4] <= 0;
		 registers[5] <= 0;
		 registers[6] <= 0;
		 registers[7] <= 0;
      end 
    
      
	 registers[0] <= num_in;
    registers[1] <= registers[0];
    registers[2] <= registers[1];
    registers[3] <= registers[2];
    registers[4] <= registers[3];
    registers[5] <= registers[4];
    registers[6] <= registers[5];
    registers[7] <= registers[6];	


  end
	assign ave8 = g[10:3];




endmodule