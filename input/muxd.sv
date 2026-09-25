`include "mycpu.svh"

import mycpu_pkg::*;

module muxd
  #(parameter N = 4)
  (input logic [$clog2(N)-1:0] sel_in,
   input logic [N-1:0][15:0]  d_in,
   output logic [15:0] m_out);
   
   // m_out is assigned to the value of d_in[sel_in] if sel_in < N, 0 otherwise
   always_comb
      begin : mux_logic
         if (sel_in < N)
            m_out = d_in[sel_in];
         else
	    m_out = 0;
      end : mux_logic

endmodule
