`include "mycpu.svh"

import mycpu_pkg::*;

module cu
  (
   input logic 	         clk,
   input logic 	         rst_n,
   input logic    [15:0]   ins_in,
   input logic    [1:0]    nz_in,
   output logic            il_out,
   output logic   [1:0]    ps_out,
   output logic            rw_out,
   output logic   [11:0]   rs_out,
   output logic   [3:0]    mx_out,
   output 	      fs_t     fs_out, 
   output logic            wen_out,
   output logic            iom_out   
   );

   cu_state_t  st_r;
   cu_state_t  ns;
   opcode_t    opcode;

   assign opcode = opcode_t'(ins_in[15:9]);

   always_comb
      begin : idecoder
         // Default values
         ns = st_r;
         ps_out = 2'b01;
         il_out = 1'b0;
         rw_out = 1'b1;
         mx_out = 4'b0000;
         wen_out = 1'b1;
         iom_out = 1'b0;
         rs_out = {1'b0, ins_in[8:6], 1'b0, ins_in[5:3], 1'b0, ins_in[2:0]};
         fs_out = fs_t'(opcode[3:0]);

         case (st_r)
	         RST:
	            begin
		            ns = INF;
		            ps_out = 2'b00;
		            rw_out = 1'b0;
	            end
	         INF:
               begin
                  ns = EX0;
                  ps_out = 2'b00;
                  il_out = 1'b1;
                  rw_out = 1'b0;
                  mx_out = 4'b0001;
               end
	         EX0:
               begin
                  ns = INF;

                  case (opcode)
                     MOVA, INC, ADD, MUL, SUB, DEC, AND, OR, XOR, NOT, MOVB, SHR, SHL:
                        begin
		                     mx_out = 4'b0100;
		                  end
		               SRA, SLA, LDI, ADI:
		                  begin
		                     mx_out = 4'b1100;
		                  end
		               LD:
		                  begin
		                     mx_out = 4'b0010;
		                  end
		               ST:
		                  begin
		                     rw_out = 1'b0;
		                     wen_out = 1'b0;
		                  end
		               BRZ:
		                  begin
		                     if (nz_in[0] == 1'b1)
		                        ps_out = 2'b10;
		                     rw_out = 1'b0;
		                     fs_out = FMOVA;
		                  end
		               BRN:
		                  begin
		                     if (nz_in[1] == 1'b1)
		                        ps_out = 2'b10;
		                     rw_out = 1'b0;
		                     fs_out = FMOVA;
		                  end
		               JMP:
		                  begin
		                     ps_out = 2'b11;
		                     rw_out = 1'b0;
		                     fs_out = FMOVA;
		                  end
		               IOR:
		                  begin
		                     iom_out = 1'b1;
		                  end
		               IOW:
		                  begin
		                     rw_out = 1'b0;
		                     wen_out = 1'b0;
		                     iom_out = 1'b1;
		                  end
                     USR:
                        begin
                           fs_out = FUSR;
                           mx_out = 4'b0100;
		                  end
                     HAL:
                        begin
                           ns = HLT;
                           ps_out = 2'b00;
                           rw_out = 1'b0;
                        end
                     default: ns = HLT;
                  endcase
               end
            HLT:
               begin
                  ns = HLT;
                  ps_out = 2'b00;
                  rw_out = 1'b0;
               end
            default: ns = HLT;
         endcase
      end : idecoder

   always_ff @(posedge clk or negedge rst_n)
      begin : st_regs
         if (rst_n == '0)
	    st_r <= RST;
	 else
	    st_r <= ns;
      end : st_regs
   
endmodule


