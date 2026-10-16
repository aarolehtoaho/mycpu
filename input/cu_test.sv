`ifndef SYNTHESIS

`include "mycpu.svh"

import mycpu_pkg::*;
import cu_pkg::*;

program cu_test
  (
   input logic 		 clk,
   output logic 	 rst_n,
   output logic [15:0] ins_in,
   output logic [1:0] 	 nz_in,
   input logic 		 il_out,
   input logic [1:0] 	 ps_out,
   input logic 		 rw_out,
   input logic [11:0] 	 rs_out,
   input logic [3:0] 	 mx_out,
   input logic [3:0] 	 fs_out,
   input logic 		 wen_out,
   input logic 		 iom_out   
   );

   int 			 state;
   localparam int 	 OPCODE_TEST_COUNT = 50;   
   
   initial
     begin

	///////////////////////////////////////////////////////////////////////////////////////////////////////////////
	$info("T1: Reset");	
	///////////////////////////////////////////////////////////////////////////////////////////////////////////////

	rst_n = '0;
	{ ins_in, nz_in } = '0;

	@(negedge clk);	

	rst_n = '1;

	@(posedge clk);

	///////////////////////////////////////////////////////////////////////////////////////////////////////////////
	$info("T2: Opcodes");	
	///////////////////////////////////////////////////////////////////////////////////////////////////////////////
	print_st_header();

	for (int j = 0; j < OPCODE_TEST_COUNT; ++j)
	  begin
	     for (int i=0; i < OPCODE_COUNT-2; ++i) // -2 == Exclude USR and HAL
	       begin
		  automatic int testcode;
		  { ins_in, nz_in } = $urandom;           
		  if (j == 0)
		    begin
		       ins_in[15:9] = opcodetable[i];
		       testcode = i;
		    end
		  else
		    begin
		       testcode = $urandom_range(0, OPCODE_COUNT-3);
		       ins_in[15:9] = opcodetable[testcode];		       
		    end
		     
		  @(posedge clk);             	     	     
		  @(negedge clk);
		  if (!st_match( { EX0, ins_in, nz_in}, { INF, ps_out, il_out, rw_out, rs_out, mx_out, fs_out, wen_out, iom_out}, state))
		    begin
		       $error("%s", opcodetable[testcode].name());
		    end
		  print_ref_values(ins_in, nz_in, state);
		  print_st_row(ins_in, nz_in, ps_out, il_out, rw_out, rs_out, mx_out, fs_out, wen_out, iom_out);	     
		  @(posedge clk);             	     	     
	       end
	  end
	
	
	///////////////////////////////////////////////////////////////////////////////////////////////////////////////
	$info("T3: HAL");	
	///////////////////////////////////////////////////////////////////////////////////////////////////////////////
	
	{ ins_in, nz_in } = $urandom;           
	ins_in[15:9] = HAL;
	@(posedge clk);
	@(negedge clk);
	if (!st_match( { EX0, ins_in, nz_in}, { HLT, ps_out, il_out, rw_out, rs_out, mx_out, fs_out, wen_out, iom_out}, state))
	  $error("HAL");
	print_st_row(ins_in, nz_in,  ps_out, il_out, rw_out, rs_out, mx_out, fs_out, wen_out, iom_out);	     
	@(posedge clk);
	@(posedge clk);             	     	     	

	// Reset needed to get away from HAL	
	rst_n = '0;
	{ ins_in, nz_in } = '0;
	@(negedge clk);	
	rst_n = '1;
	@(posedge clk);

	///////////////////////////////////////////////////////////////////////////////////////////////////////////////
	$info("T4: Illegal");	
	///////////////////////////////////////////////////////////////////////////////////////////////////////////////

	{ ins_in, nz_in } = $urandom;           
	ins_in[15:9] = 7'b1111100;
	@(posedge clk);             	     	     
	@(negedge clk);
	print_st_row(ins_in, nz_in, ps_out, il_out, rw_out, rs_out, mx_out, fs_out, wen_out, iom_out);	     
	@(posedge clk);             	     	     
	@(posedge clk);
	
	// Reset needed to get away from HAL
	rst_n = '0;
	{ ins_in, nz_in } = '0;
	@(negedge clk);	
	rst_n = '1;
	@(posedge clk);

	///////////////////////////////////////////////////////////////////////////////////////////////////////////////
	$info("T5: USR");	
	///////////////////////////////////////////////////////////////////////////////////////////////////////////////

	// ------------------------------------------------------------------------------------------------------------
	// Cycle: 0 (state INF)
	// ------------------------------------------------------------------------------------------------------------
	
	// To do: Set inputs
	ins_in[15:9] = USR;
	ins_in[8:0] = 9'b000_000_000;  // To do: Set appropriately for your test case
	nz_in = 2'b00;                 // To do: Set appropriately for your test case

	// Set inputs
   ins_in[15:9] = USR;
   ins_in[8:0] = {3'b011, 3'b001, 3'b000};   // DR, SA, SB
   nz_in = 2'b00;
   
	// Check output
   assert (ps_out == 2'b00 && il_out == 1'b1 && rw_out == 1'b0 && mx_out[0] == 1'b1 && wen_out == 1'b1 && iom_out == 1'b0)
      else $error("T5 Cycle 0 outputs incorrect!");

	// Move from cu state INF to state EXO
	@(posedge clk); 
	@(negedge clk); 

	// ------------------------------------------------------------------------------------------------------------
	// Cycle: 1 (state EX0)
	// ------------------------------------------------------------------------------------------------------------
	
	// Check output
   assert (ps_out == 2'b01 && il_out == 1'b0 && rw_out == 1'b1 && mx_out == 4'b0100 && wen_out == 1'b1 && iom_out == 1'b0 && fs_out == FUSR)
      else $error("T5 Cycle 1: outputs incorrect");
   assert (rs_out  == {1'b0, 3'b011, 1'b0, 3'b001, 1'b0, 3'b000}) 
      else $error("T5 Cycle 1: rs_out incorrect");

	// Move to next state
	@(posedge clk); 
	@(negedge clk); 

	// ------------------------------------------------------------------------------------------------------------
	// Cycle: 2 (state ?)
	// ------------------------------------------------------------------------------------------------------------
	
	// Check output
   assert (ps_out == 2'b00 && il_out == 1'b1 && rw_out == 1'b0 && mx_out[0] == 1'b1 && wen_out == 1'b1 && iom_out == 1'b0)
      else $error("T5 Cycle 2 outputs incorrect!");

	// Move to next state
	@(posedge clk); 
	@(negedge clk); 

	// Add test of the test
   ins_in[15:9] = 7'b1010101;  // Invalid opcode
	@(posedge clk); 
	@(negedge clk);
	assert (rw_out == 1'b0) else $error("Test of the test failed");
	
	
	///////////////////////////////////////////////////////////////////////////////////////////////////////////////

	$finish;
	
     end

endprogram

`endif
