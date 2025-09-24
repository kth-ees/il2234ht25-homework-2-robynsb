`timescale 1ns/1ns
module shift_register #(parameter N=4)
                      (input logic clk,
                       input logic rst_n,
                       input logic serial_parallel,
                       input logic load_enable,
                       input logic serial_in,
                       input logic [N-1:0] parallel_in,
                       output logic [N-1:0] parallel_out,
                       output logic serial_out);


	// logic [N-1:0] data;
	logic [N-1:0] inputData;

	assign inputData[N-1] = serial_parallel ? parallel_in[N-1] : serial_in;
	genvar i;
	generate
		for(i = 0; i < N-1; i = i + 1) begin
			assign inputData[i] = serial_parallel ? parallel_in[i] : parallel_out[i+1];
		end
	endgenerate

	always_ff @(posedge clk or negedge rst_n) begin
			if(!rst_n)
				parallel_out <= 0;
			else if(load_enable) 
				parallel_out <= inputData;
	end

	assign serial_out = parallel_out[0];


endmodule
