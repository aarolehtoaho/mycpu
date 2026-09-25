`ifndef SYNTHESIS

`include "mycpu.svh"

import mycpu_pkg::*;

program muxb_test
  (
   input logic 		 clk,
   input logic 		 rst_n,
   output logic 	 sel_in,
   output logic [15:0] d0_in,
   output logic [15:0] d1_in,
   input logic [15:0]  m_out);
   
   initial
      begin : test_program
   	// Initialization
   	sel_in = '0;
   	d0_in = '0;
   	d1_in = '0;
   	wait(rst_n);

   	$info("T1");
   	// Assign student number's last four digits to d0_in
   	@(negedge clk);
   	d0_in = 7395; // 16'b0001110011100011
   	d1_in = 0;
   	sel_in = '0;
   
   	@(posedge clk);
   	assert (m_out == 7395)
           else $error("T1: muxb output value is wrong. Expected: %0d, Got: %0d", 7395, m_out);

   	$info("T2");
   	// Assign student number's last four digits in reverse order to d1_in
   	@(negedge clk);
   	d0_in = 0;
   	d1_in = 5937; // 16'b0001011100110001
   	sel_in = '1;

   	@(posedge clk);
   	assert (m_out[2:0] == 3'b001 && m_out[15:3] == '0) // d1_in[2:0] == 3'b001
           else $error("T2: muxb output value is wrong. Expected: %0d, Got: %0d", 1, m_out);
   
   	$info("T3");
   	//Generate random data to all inputs 20 times
   	repeat (20) begin

      	   sel_in = $urandom;
      	   d0_in = $urandom;
      	   d1_in = $urandom;

      	   @(posedge clk);
      	      assert((sel_in && (m_out[2:0] == d1_in[2:0] && m_out[15:3] == '0)) || (!sel_in && (m_out == d0_in)))
         	else $error("T3: muxb output value is wrong.");

      end // repeat (20)

      $finish;
   end : test_program
endprogram

`endif
