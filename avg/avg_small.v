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
	
// clr was negedge
    always@(posedge ctrl or posedge clr) begin
		 if(clr) begin
			  out_hold <= 'b0;
		 end else begin
			  out_hold <= out_hold + a;
		 end
		 
	end
	assign out = out_hold;
		
endmodule

// update state numbers reset is 0, while first number is 1. This throughs off mux

module avg_small(
    input clk,
    input rs,
    output [7:0] ave8,
    input  [7:0] num_in
    );
	 
	 reg [7:0] registers [7:0] ;
	 reg [3:0] state;
	 reg [3:0] next_state ;

	 wire [10:0] temp_sum_wire;
	 reg [7:0] output_register;
	 
	 wire [7:0] a;
	 reg clr_adder;


	 
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
		.ctrl(clk),
      .clr(clr_adder),
	   .a(a),
		.out(temp_sum_wire)
	 );

     always@(posedge clk) begin
         if(rs)
            state <= state_Reset;
        else 
            state <= next_state;
     end

     always @(state) begin
         case(state)
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
				 
				 
				 
				 
				 
             state_8: begin // I guess what is happening here is that stage 2 sets up the numbers
				 // to be added, then on clock we set the output_reg from temp_sum, b4 its added and
				 // then we set clear.
				 
				 // clr_adder <= 1;
				 // output_register <= temp_sum_wire[10:3];
				 // next_state <= state_0;
				 
				 
                next_state <= state_9; // state and not new_state because state is the selector for
					 // mux and otherwise we dont add 0.
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
     //always @(num_in)begin
     //end

endmodule
	 


