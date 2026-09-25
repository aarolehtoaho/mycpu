`include "mycpu.svh"

import mycpu_pkg::*;

module muxb
  (input logic sel_in,
   input logic [15:0] d0_in,
   input logic [15:0] d1_in,
   output logic [15:0] m_out);
   
   // When sel_in == '0, d0_in is assigned to m_out. When sel_in == '1, d1_in[2:0] is assigned to m_out[2:0], and all other bits are 0.
   always_comb
     begin : mux_logic
       case (sel_in)
         1'b0:
           m_out = d0_in;
         1'b1:
	   begin
             m_out[2:0] = d1_in[2:0];
	     m_out[15:3] = '0;
	   end
       endcase
     end : mux_logic
   
endmodule

