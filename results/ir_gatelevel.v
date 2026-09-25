/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Ultra(TM) in wire load mode
// Version   : T-2022.03-SP5-1
// Date      : Wed Sep 23 13:34:53 2026
/////////////////////////////////////////////////////////////


module ir ( clk, rst_n, il_in, ins_in, ins_out );
  input [15:0] ins_in;
  output [15:0] ins_out;
  input clk, rst_n, il_in;
  wire   n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18;

  DFFARX1_HVT ir_r_reg_15_ ( .D(n17), .CLK(clk), .RSTB(rst_n), .Q(ins_out[15])
         );
  DFFARX1_HVT ir_r_reg_14_ ( .D(n16), .CLK(clk), .RSTB(rst_n), .Q(ins_out[14])
         );
  DFFARX1_HVT ir_r_reg_13_ ( .D(n15), .CLK(clk), .RSTB(rst_n), .Q(ins_out[13])
         );
  DFFARX1_HVT ir_r_reg_12_ ( .D(n14), .CLK(clk), .RSTB(rst_n), .Q(ins_out[12])
         );
  DFFARX1_HVT ir_r_reg_11_ ( .D(n13), .CLK(clk), .RSTB(rst_n), .Q(ins_out[11])
         );
  DFFARX1_HVT ir_r_reg_10_ ( .D(n12), .CLK(clk), .RSTB(rst_n), .Q(ins_out[10])
         );
  DFFARX1_HVT ir_r_reg_9_ ( .D(n11), .CLK(clk), .RSTB(rst_n), .Q(ins_out[9])
         );
  DFFARX1_HVT ir_r_reg_8_ ( .D(n10), .CLK(clk), .RSTB(rst_n), .Q(ins_out[8])
         );
  DFFARX1_HVT ir_r_reg_7_ ( .D(n9), .CLK(clk), .RSTB(rst_n), .Q(ins_out[7]) );
  DFFARX1_HVT ir_r_reg_6_ ( .D(n8), .CLK(clk), .RSTB(rst_n), .Q(ins_out[6]) );
  DFFARX1_HVT ir_r_reg_5_ ( .D(n7), .CLK(clk), .RSTB(rst_n), .Q(ins_out[5]) );
  DFFARX1_HVT ir_r_reg_4_ ( .D(n6), .CLK(clk), .RSTB(rst_n), .Q(ins_out[4]) );
  DFFARX1_HVT ir_r_reg_3_ ( .D(n5), .CLK(clk), .RSTB(rst_n), .Q(ins_out[3]) );
  DFFARX1_HVT ir_r_reg_2_ ( .D(n4), .CLK(clk), .RSTB(rst_n), .Q(ins_out[2]) );
  DFFARX1_HVT ir_r_reg_1_ ( .D(n3), .CLK(clk), .RSTB(rst_n), .Q(ins_out[1]) );
  DFFARX1_HVT ir_r_reg_0_ ( .D(n2), .CLK(clk), .RSTB(rst_n), .Q(ins_out[0]) );
  INVX2_HVT U19 ( .A(il_in), .Y(n18) );
  AO22X1_HVT U20 ( .A1(il_in), .A2(ins_in[15]), .A3(n18), .A4(ins_out[15]), 
        .Y(n17) );
  AO22X1_HVT U21 ( .A1(il_in), .A2(ins_in[14]), .A3(n18), .A4(ins_out[14]), 
        .Y(n16) );
  AO22X1_HVT U22 ( .A1(il_in), .A2(ins_in[13]), .A3(n18), .A4(ins_out[13]), 
        .Y(n15) );
  AO22X1_HVT U23 ( .A1(il_in), .A2(ins_in[12]), .A3(n18), .A4(ins_out[12]), 
        .Y(n14) );
  AO22X1_HVT U24 ( .A1(il_in), .A2(ins_in[11]), .A3(n18), .A4(ins_out[11]), 
        .Y(n13) );
  AO22X1_HVT U25 ( .A1(il_in), .A2(ins_in[10]), .A3(n18), .A4(ins_out[10]), 
        .Y(n12) );
  AO22X1_HVT U26 ( .A1(il_in), .A2(ins_in[9]), .A3(n18), .A4(ins_out[9]), .Y(
        n11) );
  AO22X1_HVT U27 ( .A1(il_in), .A2(ins_in[8]), .A3(n18), .A4(ins_out[8]), .Y(
        n10) );
  AO22X1_HVT U28 ( .A1(il_in), .A2(ins_in[7]), .A3(n18), .A4(ins_out[7]), .Y(
        n9) );
  AO22X1_HVT U29 ( .A1(il_in), .A2(ins_in[6]), .A3(n18), .A4(ins_out[6]), .Y(
        n8) );
  AO22X1_HVT U30 ( .A1(il_in), .A2(ins_in[5]), .A3(n18), .A4(ins_out[5]), .Y(
        n7) );
  AO22X1_HVT U31 ( .A1(il_in), .A2(ins_in[4]), .A3(n18), .A4(ins_out[4]), .Y(
        n6) );
  AO22X1_HVT U32 ( .A1(il_in), .A2(ins_in[3]), .A3(n18), .A4(ins_out[3]), .Y(
        n5) );
  AO22X1_HVT U33 ( .A1(il_in), .A2(ins_in[2]), .A3(n18), .A4(ins_out[2]), .Y(
        n4) );
  AO22X1_HVT U34 ( .A1(il_in), .A2(ins_in[1]), .A3(n18), .A4(ins_out[1]), .Y(
        n3) );
  AO22X1_HVT U35 ( .A1(il_in), .A2(ins_in[0]), .A3(n18), .A4(ins_out[0]), .Y(
        n2) );
endmodule

