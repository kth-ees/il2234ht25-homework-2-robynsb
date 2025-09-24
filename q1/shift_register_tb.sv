`timescale 1ns/1ns
module shift_register_tb;
    localparam N=4;
    
	logic clk;
	logic rst_n;
	logic serial_parallel;
	logic load_enable;
	logic serial_in;
	logic [N-1:0] parallel_in;
	logic [N-1:0] parallel_out;
	logic serial_out;

	shift_register shit_register_inst (
		.clk(clk),
		.rst_n(rst_n),
		.serial_parallel(serial_parallel),
		.load_enable(load_enable),
		.serial_in(serial_in),
		.parallel_in(parallel_in),
		.parallel_out(parallel_out),
		.serial_out(serial_out)
	);


	initial begin
		clk = 0;
		forever #5 clk = ~clk;
	end

	initial begin
		$monitor("Time = %0t | clk=%d parallel_in=%d parallel_out=%d", $time, clk, parallel_in, parallel_out);
		rst_n = 0;
		serial_parallel = 1;
		load_enable = 0;
		#2;
		rst_n = 1;
		#10;
		load_enable = 1;
		parallel_in = 4'b1010;
		#10;
		serial_parallel = 0;
		serial_in = 0;
		#40; 
		// write 1011
		serial_in = 1;
		#10;
		serial_in = 1;
		#10;
		serial_in = 0;
		#10;
		serial_in = 1;
		#10;
		load_enable = 0;




	end


endmodule
