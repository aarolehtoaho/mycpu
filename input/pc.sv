`include "mycpu.svh"

import mycpu_pkg::*;

module pc
  (
   input logic 	       clk,
   input logic 	       rst_n,
   input logic [1:0]   ps_in,
   input logic [15:0]  ins_in,
   input logic [15:0]  ra_in, 
   output logic [15:0] pc_out      
   );

   logic [15:0] pc_r;   	// Program counter register bits
   logic [5:0] ba; 		// Immediate branch address

   assign ba = {ins_in[8:6], ins_in[2:0]};

   // pc_r is asynchronously reset when rst_n == '0. pc_r is assigned synchronously based on ps_in value.
   always_ff @(posedge clk or negedge rst_n)
      begin : pc_regs

         if (rst_n == '0)
            pc_r <= '0;
         else
            case (ps_in)
	       2'b00: pc_r <= pc_r;
	       2'b01: pc_r <= pc_r + 1'b1;
	       2'b10: pc_r <= pc_r + {{10{ba[5]}}, ba};	// ba is expanded to 16 bits and treated as a signed number
	       2'b11: pc_r <= ra_in;
	    endcase

      end : pc_regs

   assign pc_out = pc_r;

endmodule
   
