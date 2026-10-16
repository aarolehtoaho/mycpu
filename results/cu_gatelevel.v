/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Ultra(TM) in wire load mode
// Version   : T-2022.03-SP5-1
// Date      : Thu Oct 15 15:19:42 2026
/////////////////////////////////////////////////////////////


module cu ( clk, rst_n, ins_in, nz_in, il_out, ps_out, rw_out, rs_out, mx_out, 
        fs_out, wen_out, iom_out );
  input [15:0] ins_in;
  input [1:0] nz_in;
  output [1:0] ps_out;
  output [11:0] rs_out;
  output [3:0] mx_out;
  output [3:0] fs_out;
  input clk, rst_n;
  output il_out, rw_out, wen_out, iom_out;
  wire   \ns[2] , \ns[0] , il_out, n52, n53, n54, n55, n56, n57, n58, n59, n60,
         n61, n62, n63, n64, n65, n66, n67, n68, n69, n70, n71, n72, n73, n74,
         n75, n76, n77, n78, n79, n80, n81, n82, n83, n84, n85, n86, n87, n88,
         n89, n90, n91, n92, n93, n94, n95, n96, n97, n98, n99;
  wire   [2:0] st_r;
  assign rs_out[3] = 1'b0;
  assign rs_out[7] = 1'b0;
  assign rs_out[11] = 1'b0;
  assign fs_out[3] = ins_in[12];
  assign fs_out[2] = ins_in[11];
  assign fs_out[1] = ins_in[10];
  assign rs_out[10] = ins_in[8];
  assign rs_out[9] = ins_in[7];
  assign rs_out[8] = ins_in[6];
  assign rs_out[6] = ins_in[5];
  assign rs_out[5] = ins_in[4];
  assign rs_out[4] = ins_in[3];
  assign rs_out[2] = ins_in[2];
  assign rs_out[1] = ins_in[1];
  assign rs_out[0] = ins_in[0];
  assign mx_out[0] = il_out;

  DFFARX1_HVT st_r_reg_0_ ( .D(\ns[0] ), .CLK(clk), .RSTB(rst_n), .Q(st_r[0])
         );
  DFFARX1_HVT st_r_reg_2_ ( .D(\ns[2] ), .CLK(clk), .RSTB(rst_n), .Q(st_r[2]), 
        .QN(n99) );
  DFFARX1_HVT st_r_reg_1_ ( .D(il_out), .CLK(clk), .RSTB(rst_n), .Q(st_r[1]), 
        .QN(n98) );
  INVX0_HVT U67 ( .A(ins_in[10]), .Y(n65) );
  INVX0_HVT U68 ( .A(ins_in[12]), .Y(n66) );
  INVX0_HVT U69 ( .A(ins_in[11]), .Y(n64) );
  INVX0_HVT U70 ( .A(ins_in[13]), .Y(n71) );
  INVX0_HVT U71 ( .A(ins_in[9]), .Y(n91) );
  INVX0_HVT U72 ( .A(n77), .Y(n92) );
  INVX0_HVT U73 ( .A(n63), .Y(n96) );
  NAND2X0_HVT U74 ( .A1(n96), .A2(st_r[1]), .Y(n77) );
  AND2X1_HVT U75 ( .A1(n52), .A2(n53), .Y(ps_out[1]) );
  AND2X1_HVT U76 ( .A1(n92), .A2(ins_in[15]), .Y(n52) );
  OR2X1_HVT U77 ( .A1(n93), .A2(n94), .Y(n53) );
  AND2X1_HVT U78 ( .A1(n54), .A2(n55), .Y(iom_out) );
  AND2X1_HVT U79 ( .A1(n92), .A2(ins_in[9]), .Y(n54) );
  OR2X1_HVT U80 ( .A1(n82), .A2(n83), .Y(n55) );
  AND2X1_HVT U81 ( .A1(n56), .A2(n57), .Y(mx_out[2]) );
  AND2X1_HVT U82 ( .A1(n71), .A2(n92), .Y(n56) );
  OR2X1_HVT U83 ( .A1(mx_out[3]), .A2(n68), .Y(n57) );
  OR2X1_HVT U84 ( .A1(st_r[0]), .A2(st_r[2]), .Y(n63) );
  NOR2X0_HVT U85 ( .A1(ins_in[15]), .A2(ins_in[14]), .Y(n68) );
  AO22X1_HVT U86 ( .A1(ins_in[10]), .A2(ins_in[9]), .A3(n65), .A4(n91), .Y(n58) );
  NAND4X0_HVT U87 ( .A1(n68), .A2(ins_in[11]), .A3(n66), .A4(n58), .Y(n62) );
  AO221X1_HVT U88 ( .A1(ins_in[11]), .A2(ins_in[10]), .A3(n64), .A4(ins_in[12]), .A5(ins_in[14]), .Y(n61) );
  NAND2X0_HVT U89 ( .A1(n66), .A2(n65), .Y(n59) );
  NAND3X0_HVT U90 ( .A1(ins_in[15]), .A2(n59), .A3(n91), .Y(n60) );
  AO221X1_HVT U91 ( .A1(n62), .A2(n61), .A3(n62), .A4(n60), .A5(ins_in[13]), 
        .Y(n70) );
  NOR2X0_HVT U92 ( .A1(n77), .A2(n70), .Y(mx_out[3]) );
  AO22X1_HVT U93 ( .A1(st_r[0]), .A2(st_r[2]), .A3(st_r[1]), .A4(n63), .Y(n86)
         );
  AND3X1_HVT U94 ( .A1(n66), .A2(n65), .A3(n64), .Y(n72) );
  AND3X1_HVT U95 ( .A1(ins_in[13]), .A2(n68), .A3(n72), .Y(n82) );
  NAND3X0_HVT U96 ( .A1(ins_in[13]), .A2(ins_in[15]), .A3(ins_in[14]), .Y(n74)
         );
  INVX0_HVT U97 ( .A(n74), .Y(n67) );
  NAND3X0_HVT U98 ( .A1(n72), .A2(n67), .A3(n91), .Y(n89) );
  OAI21X1_HVT U99 ( .A1(n72), .A2(n71), .A3(n68), .Y(n69) );
  AND3X1_HVT U100 ( .A1(n70), .A2(n89), .A3(n69), .Y(n79) );
  NAND4X0_HVT U101 ( .A1(ins_in[12]), .A2(ins_in[10]), .A3(ins_in[11]), .A4(
        ins_in[9]), .Y(n73) );
  NAND3X0_HVT U102 ( .A1(ins_in[14]), .A2(n72), .A3(n71), .Y(n80) );
  OA21X1_HVT U103 ( .A1(n74), .A2(n73), .A3(n80), .Y(n88) );
  AND2X1_HVT U104 ( .A1(n79), .A2(n88), .Y(n75) );
  OA21X1_HVT U105 ( .A1(n82), .A2(n75), .A3(n92), .Y(n76) );
  OR3X1_HVT U106 ( .A1(n86), .A2(mx_out[2]), .A3(n76), .Y(rw_out) );
  AND3X1_HVT U107 ( .A1(n92), .A2(n82), .A3(n91), .Y(mx_out[1]) );
  INVX0_HVT U108 ( .A(ins_in[15]), .Y(n81) );
  AND2X1_HVT U109 ( .A1(n79), .A2(n80), .Y(n97) );
  OR2X1_HVT U110 ( .A1(n97), .A2(n77), .Y(n78) );
  OA21X1_HVT U111 ( .A1(n81), .A2(n78), .A3(ins_in[9]), .Y(fs_out[0]) );
  INVX0_HVT U112 ( .A(n78), .Y(n95) );
  NAND3X0_HVT U113 ( .A1(n79), .A2(n95), .A3(n81), .Y(wen_out) );
  INVX0_HVT U114 ( .A(n80), .Y(n90) );
  AND2X1_HVT U115 ( .A1(n81), .A2(n90), .Y(n83) );
  NAND2X0_HVT U116 ( .A1(ins_in[9]), .A2(n90), .Y(n85) );
  OA21X1_HVT U117 ( .A1(nz_in[0]), .A2(ins_in[9]), .A3(ins_in[15]), .Y(n84) );
  OAI21X1_HVT U118 ( .A1(nz_in[1]), .A2(n85), .A3(n84), .Y(n87) );
  AO221X1_HVT U119 ( .A1(n92), .A2(n88), .A3(n92), .A4(n87), .A5(n86), .Y(
        ps_out[0]) );
  INVX0_HVT U120 ( .A(n89), .Y(n94) );
  OA221X1_HVT U121 ( .A1(ins_in[9]), .A2(nz_in[0]), .A3(n91), .A4(nz_in[1]), 
        .A5(n90), .Y(n93) );
  AO21X1_HVT U122 ( .A1(n96), .A2(n98), .A3(n95), .Y(\ns[0] ) );
  AND3X1_HVT U123 ( .A1(st_r[0]), .A2(n99), .A3(n98), .Y(il_out) );
  AO221X1_HVT U124 ( .A1(st_r[1]), .A2(st_r[0]), .A3(st_r[1]), .A4(n97), .A5(
        st_r[2]), .Y(\ns[2] ) );
endmodule

