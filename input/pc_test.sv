`ifndef SYNTHESIS

`include "mycpu.svh"

import mycpu_pkg::*;

program pc_test
  (
   input logic 	       	clk,
   output logic 	rst_n,
   output logic [1:0]  	ps_in,
   output logic [15:0] 	ins_in,
   output logic [15:0] 	ra_in,
   input logic [15:0]  	pc_out
   );

   initial
     begin

	///////////////////////////////////////////////////////////////////////
	$info("T1: Reset Test");
	///////////////////////////////////////////////////////////////////////	

	ps_in = '0;
	ins_in = 16'b00000000_00000000;
	ra_in = 16'b00000000_00000000;

	rst_n = 1'b0;
	@(negedge clk);
        @(negedge clk);
	rst_n = 1'b1;
	@(negedge clk);

	///////////////////////////////////////////////////////////////////////	
	$info("T2");
	///////////////////////////////////////////////////////////////////////	

	ps_in = 2'b00;		// pc_r = pc_r
	@(posedge clk);

	assert (pc_out == 16'b00000000_00000000) else $error("%16b != %16b", pc_out, 16'b00000000_00000000);
	@(negedge clk);

	///////////////////////////////////////////////////////////////////////	
	$info("T3");
	///////////////////////////////////////////////////////////////////////	

	ps_in = 2'b01;		// pc_r = pc_r + 1
	@(posedge clk);

	assert (pc_out == 16'b00000000_00000001) else $error("%16b != %16b", pc_out, 16'b00000000_00000001);
	@(negedge clk);

	///////////////////////////////////////////////////////////////////////	
	$info("T4");
	///////////////////////////////////////////////////////////////////////	

	ps_in = 2'b10;		// pc_r = pc_r + ba
	ins_in = 16'b00000000_11000111;
	@(posedge clk);

	assert (pc_out == 16'b00000000_00100000) else $error("%16b != %16b", pc_out, 16'b00000000_00100000);
	@(negedge clk);

	///////////////////////////////////////////////////////////////////////	
	$info("T5");
	///////////////////////////////////////////////////////////////////////	

	ps_in = 2'b11;		// pc_r = ra_in
	@(posedge clk);

	assert (pc_out == 16'b00000000_00000000) else $error("%16b != %16b", pc_out, 16'b00000000_00000000);
	@(negedge clk);

	///////////////////////////////////////////////////////////////////////	
	$info("T6: All bits to 1");
	///////////////////////////////////////////////////////////////////////	

	ins_in = 16'hFFFF;
	ra_in  = 16'hFFFF;
	ps_in  = 2'b11;
	@(posedge clk);

	assert (pc_out == 16'hFFFF) else $error("%16h != 16'hFFFF", pc_out);
	@(negedge clk);

	///////////////////////////////////////////////////////////////////////	
	$info("T7: All bits to 0");
	///////////////////////////////////////////////////////////////////////	

	ins_in = 16'h0000;
	ra_in  = 16'h0000;
	ps_in  = 2'b00;
	@(posedge clk);

	ps_in  = 2'b11;
	@(posedge clk);

	assert (pc_out == 16'h0000) else $error("%16h != 16'h0000", pc_out);
	@(negedge clk);

	/////////////////////////////////////////////////////////////////////// 
	$info("T8: Async Reset Test");
	/////////////////////////////////////////////////////////////////////// 

	ps_in = 2'b11;
	ra_in = 16'hFFFF;

	@(posedge clk);

	#1
	rst_n = 1'b0;	// Asynchronous reset with delays
	#5

	assert (pc_out == 16'h0000) else $error("Async reset failed");

	rst_n = 1'b1;
	@(negedge clk);

   end
endprogram


`endif
