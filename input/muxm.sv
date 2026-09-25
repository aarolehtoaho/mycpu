`include "mycpu.svh"

import mycpu_pkg::*;

module muxm
  (input logic sel_in,
   input logic [15:0] d0_in,
   input logic [15:0] d1_in,
   output logic [15:0] m_out);
   
   // Assigns d0_in / d1_in to m_out according to sel_in value
   always_comb
     begin : mux_logic
       case (sel_in)
         1'b0: m_out = d0_in;
         1'b1: m_out = d1_in;
       endcase
     end : mux_logic
   
endmodule

