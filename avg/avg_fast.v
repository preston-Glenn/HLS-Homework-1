`timescale 1ns / 1ps

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

  reg[8:0] temp_sum_8[3:0];
  reg[9:0] temp_sum_9[1:0];
  reg[10:0] temp_sum_10;

  initial begin
      for(integer i=0; i < 7; i=i+1)
        registers[i] <= 0;
  
  end

  always @(num_in) begin
      
    temp_sum_10 = 11'd0;
      for(integer i=1; i < 7; i=i+1)
        registers[i+1] <= registers[i];
    registers[0] = num_in;
    
    temp_sum_8[0] <= registers[0] + registers[1];
    temp_sum_8[1] <= registers[2] + registers[3];
    temp_sum_8[2] <= registers[4] + registers[5];
    temp_sum_8[3] <= registers[6] + registers[7];
    #10;

    temp_sum_9[0] <= temp_sum_8[0] + temp_sum_8[1];
    temp_sum_9[1] <= temp_sum_8[2] + temp_sum_8[3];

    #10;
    temp_sum_10 <= temp_sum_9[0] + temp_sum_9[1];
    

  end

assign  ave8 = temp_sum_10[10:3];


  always @(posedge clk) begin
      if(rs) begin
          temp_sum_10 <= 11'd0;
      end
  end

endmodule