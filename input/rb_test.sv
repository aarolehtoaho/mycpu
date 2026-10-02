`include "mycpu.svh"

import mycpu_pkg::*;

program rb_test
  (
   input logic 	       clk,
   input logic 	       rst_n,
   output logic [15:0] d_in,
   output logic        rw_in,
   output logic [11:0] rs_in,
   input logic [15:0]  a_out,
   input logic [15:0]  b_out
   );
   
   initial
     begin
	logic [3:0] N = 5;

	///////////////////////////////////////////////////////////////////////
	$info("T1: Reset Test");
	///////////////////////////////////////////////////////////////////////	
	d_in = '0;
	rw_in = '0;
	rs_in = '0;
	wait (rst_n);

	///////////////////////////////////////////////////////////////////////	
	$info("T2: Write-Read Test");
	///////////////////////////////////////////////////////////////////////
	rw_in = 1'b1;		// Enable writing

	// Write different values to each registers and check a_out and b_out with immeadiate assertions
	for (int i = 0; i < 16; i++) begin
		logic [15:0] X;
		X = N + 1 + i;

		rs_in = {i[3:0], i[3:0], i[3:0]};
	   	d_in  = X;

		@(posedge clk);
		#1
		assert (a_out == X && b_out == X) else $error("T2: a_out = %0d, b_out = %0d, X = %0d", a_out, b_out, X);
		@(negedge clk);
	end

	///////////////////////////////////////////////////////////////////////	
	$info("T3: Read Test");
	///////////////////////////////////////////////////////////////////////
	rw_in = '0;		// disable writing
	d_in = 16'hABCD;	// data which shouldn't be written

	// Check that the data from T2 has not been overwritten
	for (int i = 0; i < 16; i++) begin
		logic [15:0] X;
		X = N + 1 + i;

		rs_in = {4'b0000, i[3:0], i[3:0]};
	   	d_in  = X;

		@(posedge clk);
		#1
		assert (a_out == X && b_out == X) else $error("T3: a_out = %0d, b_out = %0d, X = %0d", a_out, b_out, X);
		@(negedge clk);
	end	

	$finish;
     end
endprogram
