`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:21:27 09/10/2021 
// Design Name: 
// Module Name:    avg_small 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////

module mux8(
    data0,
    data1,
    data2,
    data3,
	 data4,
	 data5,
	 data6,
	 data7,
    select,
    data_output
);

  parameter WIDTH = 8;

  input [WIDTH-1:0] data0;
  input [WIDTH-1:0] data1;
  input [WIDTH-1:0] data2;
  input [WIDTH-1:0] data3;
  input [WIDTH-1:0] data4;
  input [WIDTH-1:0] data5;
  input [WIDTH-1:0] data6;
  input [WIDTH-1:0] data7;
  input [2:0] select;
  output [WIDTH-1:0] data_output;

reg [WIDTH-1:0] data_bus ;
  always @ (*) begin
    case (select)
      0: data_bus <= data0 ;
      1: data_bus <= data1 ;
      2: data_bus <= data2 ;
      3: data_bus <= data3 ;
		4: data_bus <= data4 ;
		5: data_bus <= data5 ;
		6: data_bus <= data6 ;
		7: data_bus <= data7 ;
    endcase
  end
  assign data_output = data_bus ;
endmodule


module add_8_10_10(ctrl,rs,a,out);
	input [2:0] ctrl;
	input [7:0] a;
	input rs;
	output reg[10:0] out;
	
	initial begin
	out <= 0;
	end
	
	always @(ctrl) begin
		out <= a+out;
		end
	always@(posedge rs)
		out <= 0;
		
endmodule


module avg_small(
    input clk,
    input rs,
    output [7:0] ave8,
    input  [7:0] num_in
    );
	 
	 reg [7:0] registers [7:0] ;
	 reg [2:0] state;
	 reg [2:0] next_state;
	 reg [10:0] temp_sum_wire;
	 reg [7:0] output_register;
	 reg rs_adder;
	 
	 wire [7:0] a;
	 wire [10:0] b;
	 wire [10:0] c;
	 wire [10:0] add_wire;
	 
	 mux8 muxy(    
	 .data0(registers[0]),
    .data1(registers[1]),
    .data2(registers[2]),
    .data3(registers[3]),
	 .data4(registers[4]),
	 .data5(registers[5]),
	 .data6(registers[6]),
	 .data7(num_in),
    .select(state),
    .data_output(a)
);
	 
	 add_8_10_10 add(
		.ctrl(next_state),
	   .a(a),
		.rs(rs_adder),
		.out(temp_sum_wire)
	 );
	 
	 
	 initial begin
		 output_register <= 7'd0;
	 
		 registers[0] <= 2;
		 registers[1] <= 30;
		 registers[2] <= 40;
		 registers[3] <= 50;
		 registers[4] <= 60;
		 registers[5] <= 70;
		 registers[6] <= 80;
		 registers[7] <= 90;
		 state <= 0;
		 next_state <= 0;
	 end
	 
	 
	 
	 always@(posedge clk) begin
		if(state == 7 && next_state == 0) begin
				output_register <= temp_sum_wire[10:3];
				rs_adder <= 1;
		end
		state = next_state;
		rs_adder <= 1;
		
		if(rs) begin
				state <= 0;
				//TODO -- clear registers
		end else begin
	 
			case(state)
			0:begin
				registers[0] <= registers[1];
				next_state <= 1;
			end
			1:begin
				registers[1] <= registers[2];
				next_state <= 2;
			end
			2:begin
				registers[2] <= registers[3];
				next_state <= 3;
			end
			3:begin
				registers[3] <= registers[4];
				next_state <= 4;
			end
			4:begin
				registers[4] <= registers[5];
				next_state <= 5;
			end
			5:begin
				registers[5] <= registers[6];
				next_state <= 6;
			end
			6:begin
				registers[6] <= registers[7];	
				next_state <= 7;
			end
			7:begin
				registers[7] <= num_in;
				next_state <= 0;
				
			end
		 
		 endcase
		 end
	 end
	 assign ave8 = output_register;
	 
endmodule
	 


	// Things to do
	
	// 1. Reevaluate FSM
	
	// 2. Consider implementing an accumulator with a rs
	
	// 3. Investigate delays in Verilog.

