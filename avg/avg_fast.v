`timescale 1ns / 1ps


module avg_fast( 
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



  always @(posedge clk) begin
      
		if(rs) begin
		 registers[0] <= 8'd0;
		 registers[1] <= 8'd0;
		 registers[2] <= 8'd0;
		 registers[3] <= 8'd0;
		 registers[4] <= 8'd0;
		 registers[5] <= 8'd0;
		 registers[6] <= 8'd0;
		 registers[7] <= 8'd0;
      end else begin
    
		 registers[0] <= num_in;
		 registers[1] <= registers[0];
		 registers[2] <= registers[1];
		 registers[3] <= registers[2];
		 registers[4] <= registers[3];
		 registers[5] <= registers[4];
		 registers[6] <= registers[5];
		 registers[7] <= registers[6];	
	 end


  end
	//assign ave8 = g[10:3];

wire [10:0] sum = registers[0] + registers[1] + registers[2] + registers[3] + registers[4] + registers[5] + registers[6] + registers[7];
assign ave8 = sum[10:3];

endmodule
