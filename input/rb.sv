`include "mycpu.svh"

import mycpu_pkg::*;

module rb
  (
   input logic 	       clk,
   input logic 	       rst_n,
   input logic [15:0]  d_in,
   input logic 	       rw_in,
   input logic [11:0]   rs_in,
   output logic [15:0] a_out,
   output logic [15:0] b_out
   );

   logic [7:0][15:0] rb_r;
   logic [7:0][15:0] hb_r;

   // Writes data to the register banks on positive clock edge. When rw_in == '1, the value at d_in is saved in the chosen register
   always_ff @(posedge clk or negedge rst_n)
   begin : rb_write

      if (rst_n == '0)
      begin
         rb_r <= '0;
	 hb_r <= '0;
      end
      else if (rw_in == 1'b1)
      begin
	 if (rs_in[11] == 1'b0)
 	    rb_r[rs_in[10:8]] <= d_in;
  	 else
   	    hb_r[rs_in[10:8]] <= d_in;
      end
      
   end : rb_write

   // rs_in[7] selects bank, and rs_in[6:4] value which is written to a_out
   always_comb
   begin : mux_a
      if (rs_in[7] == 1'b0)
         a_out = rb_r[rs_in[6:4]];
      else
         a_out = hb_r[rs_in[6:4]];
   end : mux_a

   // rs_in[3] selects bank, and rs_in[2:0] value which is written to b_out
   always_comb
   begin : mux_b
      if (rs_in[3] == 1'b0)
         b_out = rb_r[rs_in[2:0]];
      else
         b_out = hb_r[rs_in[2:0]];
   end : mux_b

endmodule

