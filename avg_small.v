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

`include "params.v"
    
    

module mux(
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
  input [3:0] select;
  output [WIDTH-1:0] data_output;

reg [WIDTH-1:0] data_bus ;
  always @ (*) begin
    case (select)
        state_0: data_bus <= data0 ;
        state_1: data_bus <= data1 ;
        state_2: data_bus <= data2 ;
        state_3: data_bus <= data3 ;
        state_4: data_bus <= data4 ;
        state_5: data_bus <= data5 ;
        state_6: data_bus <= data6 ;
        state_7: data_bus <= data7 ;
		  state_8: data_bus <= 0;
		  state_9: data_bus <= 0;
    endcase
  end
  assign data_output = data_bus ;
endmodule


module add_8_10_10(ctrl,clr,a,out);
	input ctrl;
   input clr;
	input [7:0] a;
	output [10:0] out;
	
	reg [10:0] out_hold;
	
	// Module is controlled by clock or clear(clr) flag
    always@(posedge ctrl or posedge clr) begin
		 if(clr) begin
			  out_hold <= 'b0;
		 end else begin
			  out_hold <= out_hold + a;
		 end
		 
	end
	assign out = out_hold;
		
endmodule


module avg_small(
    input clk,
    input rs,
    output [7:0] ave8,
    input  [7:0] num_in
    );
	 
	 reg [7:0] registers [7:0] ;		// stores values of the inputed numbers
	 reg [3:0] state;						// tracks the state of the FSM
	 reg [3:0] next_state ;				// tracks next state of the FSM

	 wire [10:0] temp_sum_wire;		// wire out of adder
	 reg [7:0] output_register;		// Stores value that output port should emit
	 
	 wire [7:0] a;							// Connects the mux to the adder
	 reg clr_adder;						// value to clear the adder (=1)


	 // Controls what value goes to the adder
	 mux muxy(    
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
	 
	 // This is the single adder of the module
	 add_8_10_10 add(
		.ctrl(clk),
      .clr(clr_adder),
	   .a(a),
		.out(temp_sum_wire)
	 );

		// The state is updated every clock cycle
     always@(posedge clk) begin
         if(rs)
            state <= state_Reset;
        else 
            state <= next_state;
     end

	// Action takes place once the state is set to next state.
     always @(state) begin
         case(state)
				// Reset the FSM
             state_Reset: begin
                 // make zeros
                registers[0] <= 0;
                registers[1] <= 0;
                registers[2] <= 0;
                registers[3] <= 0;
                registers[4] <= 0;
                registers[5] <= 0;
                registers[6] <= 0;
                registers[7] <= 0;
                
                next_state <= state_0;
                clr_adder <= 1;
             end
             state_0: begin
                registers[0] <= registers[1];
                next_state <= state_1;
                clr_adder <= 0;
             end
             state_1: begin
                registers[1] <= registers[2];
                next_state <= state_2;
             end
             state_2: begin 
                registers[2] <= registers[3];
                next_state <= state_3;
             end
				 state_3: begin 
                registers[3] <= registers[4];
                next_state <= state_4;
             end
				 state_4: begin 
                registers[4] <= registers[5];
                next_state <= state_5;
             end
				 state_5: begin 
                registers[5] <= registers[6];
                next_state <= state_6;
             end
				 state_6: begin 
                registers[6] <= registers[7];
                next_state <= state_7;
             end
				 state_7: begin 
                registers[7] <= num_in;
                next_state <= state_8;
             end
	 
				 // This is an update state. It's needed because state_7 "loads" a value to be added 
				 // and the clock must trigger the adder before it triggers the output
				 
				 // WHAT I DID WRONG INITIALLY
				 // On the clock pulse from state 7 -> 8 the last addition would be called, but
				 // state 8 had what state_9 now is. So, it would also set the output to what
				 // the adder was at the clock pulse. ie the value b4 the value was added
				 
             state_8: begin 
                next_state <= state_9;
             end
				 state_9: begin 
					 clr_adder <= 1;
                output_register <= temp_sum_wire[10:3];
                next_state <= state_0;
             end
             default begin
                next_state <= state_Reset;
                clr_adder <= 0;
             end	 
			endcase
     end

    assign ave8 = output_register;
endmodule