


module avg_fast_tb();

	// Inputs

	reg clk;
	reg [7:0] num_in;
   reg rs;
	// Outputs
	wire [7:0] out;

	// Instantiate the Unit Under Test (UUT)
	avg_fast uut (
    .num_in(num_in), 
    .clk(clk),
    .rs(rs),
    .ave8(out)
	);
	initial begin
		// Initialize Inputs
		clk = 0;
		
		// Trigger Reset
		rs <= 1;
      clk <= clk + 1;
		#100;
		
		clk <= clk+1;
		#100


		rs <= 0;
      num_in <= 8'd200;
		

      clk <= clk + 1;
		#100;
		

		clk <= clk+1;
		#100
		
		

		clk <= clk + 1;
      num_in <= 8'd100;
		#100;
        

      clk <= clk + 1;
		#100;
		
		
		
		clk <= clk + 1;
      num_in <= 8'd200;
		#100;
        
        clk <= clk + 1;
		#100;
		
		
		
		clk <= clk + 1;
      num_in <= 8'd255;
		#100;
        
      clk <= clk + 1;
		#100;
		
		
		
		clk <= clk + 1;
      num_in <= 8'd91;
		#100;
        
      clk <= clk + 1;
		#100;
		
		
		
		clk <= clk + 1;
      num_in <= 8'd25;
		#100;
        
      clk <= clk + 1;
		#100;
		
		
		clk <= clk + 1;
      num_in <= 8'd100;
		#100;
        
      clk <= clk + 1;
		#100;
		
		
		
		clk <= clk + 1;
      num_in <= 8'd25;
		#100;
        
      clk <= clk + 1;
		#100;
		
		
		
		clk <= clk + 1;
      num_in <= 8'd24;
		#100;
        
      clk <= clk + 1;
		#100;




      clk <= clk + 1;
      rs<= 1'd1;
		#100;


        
        
        clk <= clk + 1;
		#100;

	end
      
endmodule
