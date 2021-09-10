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
    data_output,
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


module add_8_10_10(ctrl,a,b,out);
	input [2:0] ctrl;
	input [7:0] a;
	input [10:0] b;
	output[10:0] out;
	
	always @(ctrl)
		out <= a+b;
		
endmodule


module avg_small(
    input clk,
    input rs,
    output [7:0] avg8,
    input  [7:0] in_num
    );
	 
	 reg [7:0] registers [7:0] ;
	 reg [2:0] state = 3'd0;
	 reg [2:0] next_state =3'd0;
	 reg [10:0] temp_sum = 11'd0;
	 reg [7:0] output_register;
	 
	 wire [7:0] a;
	 wire [10:0] b;
	 wire [10:0] c;
	 
	 mux8 muxy(    
	 .data0(registers[0]),
    .data1(registers[1]),
    .data2(registers[2]),
    .data3(registers[3]),
	 .data4(registers[4]),
	 .data5(registers[5]),
	 .data6(registers[6]),
	 .data7(in_num),
    .select(state),
    .data_output(a),
);
	 
	 add_8_10_10 add(
		.ctrl(state),
	   .a(a),
		.b(temp_sum),
		.out(temp_sum)
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
	 
	 
	 
	 always@(posedge clk) begin
		if(rs) begin
				state <= 0;
				//TODO -- clear registers
				
		end else begin
			state <= next_state;
		end
	 end
	 
	 always@( state) begin
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
		
			next_state <= 3;
		end
		3:begin
		
			next_state <= 4;
		end
		4:begin
		
			next_state <= 5;
		end
		5:begin
		
			next_state <= 6;
		end
		6:begin
		
			next_state <= 7;
		end
		7:begin
		
			next_state <= 0;
		end
	 
	 endcase
	 end
	 
	 
endmodule
	 

	 // Things to do
	 //
	 //  Connect MUX to adder,
	 //  Connect adder to temp register
	 //  At end of the FSM set out_register to temp_sum_register
	 //  In each state, shift register.
	 //  Assign out_register to output

// currently, the FSM is controlled by the clock so it takes 8 CC. Im not sure how 
// how to control timing of everything without doing so. And i think it is messeg up atm.
endmodule

