module avg_fast_tb();

	// Inputs

	reg clk;
	reg [7:0] num_in;
    reg rs;
	// Outputs
	wire [7:0] out;

	// Instantiate the Unit Under Test (UUT)
	avg_small uut (
    .num_in(num_in), 
    .clk(clk),
    .rs(rs),
    .ave8(out)
	);
	initial begin
		// Initialize Inputs
		clk = 0;
		
		
		rs <= 1;
		clk <= clk + 1;
		#100;
		rs <= 0;
		clk <= clk + 1;
		#100;
		
		// First number
		num_in <= 8'd100;
      clk <= clk + 1;
		#100;
		clk <= clk + 1;
		#100;
		
		
      clk <= clk + 1;
		#100;
		clk <= clk + 1;
		#100;
		
		
		clk <= clk + 1;
		#100;
		clk <= clk + 1;
		#100;
		
		
		clk <= clk + 1;
		#100;
		clk <= clk + 1;
		#100;
		
		clk <= clk + 1;
		#100;
		clk <= clk + 1;
		#100;
		
		
      clk <= clk + 1;
		#100;
		clk <= clk + 1;
		#100;
		
		
		clk <= clk + 1;
		#100;
		clk <= clk + 1;
		#100;
		
		
		clk <= clk + 1;
		#100;
		clk <= clk + 1;
		#100;
		
		clk <= clk + 1;
		#100;
		clk <= clk + 1;
		#100;
		
		
		clk <= clk + 1;
		#100;
		clk <= clk + 1;
		#100;
		
		
		
		
		// 2nd number
		num_in <= 8'd20;
		      clk <= clk + 1;
		#100;
		clk <= clk + 1;
		#100;
		
		
      clk <= clk + 1;
		#100;
		clk <= clk + 1;
		#100;
		
		
		clk <= clk + 1;
		#100;
		clk <= clk + 1;
		#100;
		
		
		clk <= clk + 1;
		#100;
		clk <= clk + 1;
		#100;
		
		clk <= clk + 1;
		#100;
		clk <= clk + 1;
		#100;
		
		
      clk <= clk + 1;
		#100;
		clk <= clk + 1;
		#100;
		
		
		clk <= clk + 1;
		#100;
		clk <= clk + 1;
		#100;
		
		
		clk <= clk + 1;
		#100;
		clk <= clk + 1;
		#100;
		
		clk <= clk + 1;
		#100;
		clk <= clk + 1;
		#100;
		
		
		clk <= clk + 1;
		#100;
		clk <= clk + 1;
		#100;
		
		
		
		// third number
		num_in <= 8'd55;
		clk <= clk + 1;
		#100;
		clk <= clk + 1;
		#100;
		
		
      clk <= clk + 1;
		#100;
		clk <= clk + 1;
		#100;
		
		
		clk <= clk + 1;
		#100;
		clk <= clk + 1;
		#100;
		
		
		clk <= clk + 1;
		#100;
		clk <= clk + 1;
		#100;
		
		clk <= clk + 1;
		#100;
		clk <= clk + 1;
		#100;
		
		
      clk <= clk + 1;
		#100;
		clk <= clk + 1;
		#100;
		
		
		clk <= clk + 1;
		#100;
		clk <= clk + 1;
		#100;
		
		
		clk <= clk + 1;
		#100;
		clk <= clk + 1;
		#100;
		
		clk <= clk + 1;
		#100;
		clk <= clk + 1;
		#100;
		
		
		clk <= clk + 1;
		#100;
		clk <= clk + 1;
		#100;


		// fourth
		num_in <= 8'd80;
		clk <= clk + 1;
		#100;
		clk <= clk + 1;
		#100;
		
		
      clk <= clk + 1;
		#100;
		clk <= clk + 1;
		#100;
		
		
		clk <= clk + 1;
		#100;
		clk <= clk + 1;
		#100;
		
		
		clk <= clk + 1;
		#100;
		clk <= clk + 1;
		#100;
		
		clk <= clk + 1;
		#100;
		clk <= clk + 1;
		#100;
		
		
      clk <= clk + 1;
		#100;
		clk <= clk + 1;
		#100;
		
		
		clk <= clk + 1;
		#100;
		clk <= clk + 1;
		#100;
		
		
		clk <= clk + 1;
		#100;
		clk <= clk + 1;
		#100;
		
		clk <= clk + 1;
		#100;
		clk <= clk + 1;
		#100;
		
		
		clk <= clk + 1;
		#100;
		clk <= clk + 1;
		#100;

		// fifth
		num_in <= 8'd70;
		      clk <= clk + 1;
		#100;
		clk <= clk + 1;
		#100;
		
		
      clk <= clk + 1;
		#100;
		clk <= clk + 1;
		#100;
		
		
		clk <= clk + 1;
		#100;
		clk <= clk + 1;
		#100;
		
		
		clk <= clk + 1;
		#100;
		clk <= clk + 1;
		#100;
		
		clk <= clk + 1;
		#100;
		clk <= clk + 1;
		#100;
		
		
      clk <= clk + 1;
		#100;
		clk <= clk + 1;
		#100;
		
		
		clk <= clk + 1;
		#100;
		clk <= clk + 1;
		#100;
		
		
		clk <= clk + 1;
		#100;
		clk <= clk + 1;
		#100;
		
		clk <= clk + 1;
		#100;
		clk <= clk + 1;
		#100;
		
		
		clk <= clk + 1;
		#100;
		clk <= clk + 1;
		#100;
		
		// sixth
		num_in <= 8'd120;
		      clk <= clk + 1;
		#100;
		clk <= clk + 1;
		#100;
		
		
      clk <= clk + 1;
		#100;
		clk <= clk + 1;
		#100;
		
		
		clk <= clk + 1;
		#100;
		clk <= clk + 1;
		#100;
		
		
		clk <= clk + 1;
		#100;
		clk <= clk + 1;
		#100;
		
		clk <= clk + 1;
		#100;
		clk <= clk + 1;
		#100;
		
		
      clk <= clk + 1;
		#100;
		clk <= clk + 1;
		#100;
		
		
		clk <= clk + 1;
		#100;
		clk <= clk + 1;
		#100;
		
		
		clk <= clk + 1;
		#100;
		clk <= clk + 1;
		#100;
		
		clk <= clk + 1;
		#100;
		clk <= clk + 1;
		#100;
		
		
		clk <= clk + 1;
		#100;
		clk <= clk + 1;
		#100;


		// seventh
		num_in <= 8'd40;
		      clk <= clk + 1;
		#100;
		clk <= clk + 1;
		#100;
		
		
      clk <= clk + 1;
		#100;
		clk <= clk + 1;
		#100;
		
		
		clk <= clk + 1;
		#100;
		clk <= clk + 1;
		#100;
		
		
		clk <= clk + 1;
		#100;
		clk <= clk + 1;
		#100;
		
		clk <= clk + 1;
		#100;
		clk <= clk + 1;
		#100;
		
		
      clk <= clk + 1;
		#100;
		clk <= clk + 1;
		#100;
		
		
		clk <= clk + 1;
		#100;
		clk <= clk + 1;
		#100;
		
		
		clk <= clk + 1;
		#100;
		clk <= clk + 1;
		#100;
		
		clk <= clk + 1;
		#100;
		clk <= clk + 1;
		#100;
		
		
		clk <= clk + 1;
		#100;
		clk <= clk + 1;
		#100;
		
		// eighth
		num_in <= 8'd10;
		      clk <= clk + 1;
		#100;
		clk <= clk + 1;
		#100;
		
		
      clk <= clk + 1;
		#100;
		clk <= clk + 1;
		#100;
		
		
		clk <= clk + 1;
		#100;
		clk <= clk + 1;
		#100;
		
		
		clk <= clk + 1;
		#100;
		clk <= clk + 1;
		#100;
		
		clk <= clk + 1;
		#100;
		clk <= clk + 1;
		#100;
		
		
      clk <= clk + 1;
		#100;
		clk <= clk + 1;
		#100;
		
		
		clk <= clk + 1;
		#100;
		clk <= clk + 1;
		#100;
		
		
		clk <= clk + 1;
		#100;
		clk <= clk + 1;
		#100;
		
		clk <= clk + 1;
		#100;
		clk <= clk + 1;
		#100;
		
		
		clk <= clk + 1;
		#100;
		clk <= clk + 1;
		#100;
		
		
		// ninth
		num_in <= 8'd200;
      clk <= clk + 1;
		#100;
		clk <= clk + 1;
		#100;
		
		
      clk <= clk + 1;
		#100;
		clk <= clk + 1;
		#100;
		
		
		clk <= clk + 1;
		#100;
		clk <= clk + 1;
		#100;
		
		
		clk <= clk + 1;
		#100;
		clk <= clk + 1;
		#100;
		
		clk <= clk + 1;
		#100;
		clk <= clk + 1;
		#100;
		
		
      clk <= clk + 1;
		#100;
		clk <= clk + 1;
		#100;
		
		
		clk <= clk + 1;
		#100;
		clk <= clk + 1;
		#100;
		
		
		clk <= clk + 1;
		#100;
		clk <= clk + 1;
		#100;
		
		clk <= clk + 1;
		#100;
		clk <= clk + 1;
		#100;
		
		
		clk <= clk + 1;
		#100;
		clk <= clk + 1;
		#100;












// Testing fast



        num_in <= 8'd200;
        clk <= clk + 1;
		#100;
	// Where is the delay
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

