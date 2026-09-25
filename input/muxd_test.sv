`ifndef SYNTHESIS

`include "mycpu.svh"

import mycpu_pkg::*;

program muxd_test
  (
   input logic 		   clk,
   input logic 		   rst_n,
   output logic [1:0] 	   sel_in,
   output logic [2:0][15:0] d_in,
   input logic [15:0] 	   m_out
   );

   initial
      begin : test_program
   	// Initialization
   	sel_in = '0;
   	d_in = '0;
   	wait(rst_n);

   	$info("T1");
   	//Generate random data to all inputs 20 times
   	repeat (20) begin

      	   sel_in = $urandom;
      	   d_in[0] = $urandom;
	   d_in[1] = $urandom;
	   d_in[2] = $urandom;

      	   @(posedge clk);
      	      assert(((sel_in < 3) && m_out == d_in[sel_in]) || ((sel_in >= 3) && m_out == 0)) // N == 3
         	else $error("T1: muxd output value is wrong.");

      end // repeat (20)

      $finish;
   end : test_program
   
endprogram

`endif
