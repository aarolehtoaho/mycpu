`include "mycpu.svh"

import mycpu_pkg::*;

module fu
  (
   input logic [15:0]  a_in,
   input logic [15:0]  b_in, 
   input 	       fs_t fs_in, 
   output logic [15:0] f_out,
   output logic [1:0]  nz_out
   );

   logic [15:0] alu;
   logic [15:0] mul;
   logic [15:0] usr;

   // Output value is determined by function code in fs_in
   always_comb
      begin : alu_logic

         alu = '0;
         if (fs_in == FMUL || fs_in == FUSR)
            alu = 0;
         else
            case (fs_in)
               FMOVA: alu = a_in;
               FINC: alu = 16'(a_in + 1'b1);
               FADD: alu = 16'(a_in + b_in);
               FSRA: alu = $unsigned($signed(a_in) >>> (b_in[2:0] + 1));  // $unsigned for suppressing a warning
               FSUB: alu = 16'(a_in - b_in);
               FDEC: alu = 16'(a_in - 1'b1);
               FSLA: alu = $unsigned($signed(a_in) <<< (b_in[2:0] + 1));  // $unsigned for suppressing a warning
               FAND: alu = a_in & b_in;
               FOR: alu = a_in | b_in;
               FXOR: alu = a_in ^ b_in;
               FNOT: alu = ~a_in;
               FMOVB: alu = b_in;
               FSHR: alu = b_in >> 1;
               FSHL: alu = b_in << 1;
	       default: alu = '0;
            endcase

      end : alu_logic

   // If fs_in == FMUL, signed multiplication of a_in and b_in are performed
   always_comb
      begin : mul_logic

	 logic signed [15:0] sa, sb;
         logic signed [31:0] ab;

         if (fs_in == FMUL)
            begin
               sa = $signed(a_in);
	       sb = $signed(b_in);
               ab = sa * sb;
               // Saturate the result to 16 bits
               if (ab > 32767) // > 16 bit max signed value
                  mul = 16'h7FFF;
               else if (ab < -32768) // < 16 bit min signed value
                  mul = 16'h8000;
               else
                  mul = 16'($unsigned(ab));
	    end
         else
            begin
	            mul = '0;
               sa = '0;
               sb = '0;
               ab = '0;
            end

      end : mul_logic

   // Performs a linear feedback shift register operation
   always_comb
      begin : user_logic

         if (fs_in == FUSR)
            usr = { a_in[14:0], (a_in[15] ^ a_in[13] ^ a_in[12] ^ a_in[10]) };
         else
            usr = '0;
      end : user_logic

   // Sets the output to a bit-wise OR from alu, mul and usr. Sets negative and zero flags.
   always_comb
      begin : output_logic

         f_out = alu | mul | usr;

         nz_out[0] = (f_out == 16'b0);
         nz_out[1] = f_out[15];

      end : output_logic
   
endmodule
