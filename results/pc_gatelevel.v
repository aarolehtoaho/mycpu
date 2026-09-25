/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Ultra(TM) in wire load mode
// Version   : T-2022.03-SP5-1
// Date      : Thu Sep 24 11:06:11 2026
/////////////////////////////////////////////////////////////


module pc ( clk, rst_n, ps_in, ins_in, ra_in, pc_out );
  input [1:0] ps_in;
  input [15:0] ins_in;
  input [15:0] ra_in;
  output [15:0] pc_out;
  input clk, rst_n;
  wire   n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16, n17, n18, n19, n20,
         n21, n24, n25, n26, n27, n28, n29, n30, n31, n32, n33, n34, n35, n36,
         n37, n38, n39, n40, n41, n42, n43, n44, n45, n46, n47, n48, n49, n50,
         n51, n52, n53, n54, n55, n56, n57, n58, n59, n60, n61, n62, n63, n64,
         n65, n66, n67, n68, n69, n70, n71, n72, n73, n74, n75, n76, n77, n78,
         n79, n80, n81, n82;

  DFFARX1_HVT pc_r_reg_15_ ( .D(n6), .CLK(clk), .RSTB(rst_n), .Q(pc_out[15])
         );
  DFFARX1_HVT pc_r_reg_14_ ( .D(n7), .CLK(clk), .RSTB(rst_n), .Q(pc_out[14])
         );
  DFFARX1_HVT pc_r_reg_13_ ( .D(n8), .CLK(clk), .RSTB(rst_n), .Q(pc_out[13])
         );
  DFFARX1_HVT pc_r_reg_12_ ( .D(n9), .CLK(clk), .RSTB(rst_n), .Q(pc_out[12])
         );
  DFFARX1_HVT pc_r_reg_11_ ( .D(n10), .CLK(clk), .RSTB(rst_n), .Q(pc_out[11])
         );
  DFFARX1_HVT pc_r_reg_10_ ( .D(n11), .CLK(clk), .RSTB(rst_n), .Q(pc_out[10])
         );
  DFFARX1_HVT pc_r_reg_9_ ( .D(n12), .CLK(clk), .RSTB(rst_n), .Q(pc_out[9]) );
  DFFARX1_HVT pc_r_reg_8_ ( .D(n13), .CLK(clk), .RSTB(rst_n), .Q(pc_out[8]) );
  DFFARX1_HVT pc_r_reg_7_ ( .D(n14), .CLK(clk), .RSTB(rst_n), .Q(pc_out[7]) );
  DFFARX1_HVT pc_r_reg_6_ ( .D(n15), .CLK(clk), .RSTB(rst_n), .Q(pc_out[6]) );
  DFFARX1_HVT pc_r_reg_5_ ( .D(n16), .CLK(clk), .RSTB(rst_n), .Q(pc_out[5]) );
  DFFARX1_HVT pc_r_reg_4_ ( .D(n17), .CLK(clk), .RSTB(rst_n), .Q(pc_out[4]) );
  DFFARX1_HVT pc_r_reg_3_ ( .D(n18), .CLK(clk), .RSTB(rst_n), .Q(pc_out[3]) );
  DFFARX1_HVT pc_r_reg_2_ ( .D(n19), .CLK(clk), .RSTB(rst_n), .Q(pc_out[2]) );
  DFFARX1_HVT pc_r_reg_1_ ( .D(n20), .CLK(clk), .RSTB(rst_n), .Q(pc_out[1]) );
  DFFARX1_HVT pc_r_reg_0_ ( .D(n21), .CLK(clk), .RSTB(rst_n), .Q(pc_out[0]) );
  AND2X4_HVT U26 ( .A1(n24), .A2(ins_in[8]), .Y(n64) );
  INVX0_HVT U27 ( .A(ps_in[0]), .Y(n32) );
  NAND2X0_HVT U28 ( .A1(ps_in[1]), .A2(n32), .Y(n29) );
  INVX0_HVT U29 ( .A(n29), .Y(n24) );
  AND2X1_HVT U30 ( .A1(n24), .A2(ins_in[7]), .Y(n67) );
  AND2X1_HVT U31 ( .A1(n24), .A2(ins_in[6]), .Y(n70) );
  AND2X1_HVT U32 ( .A1(n24), .A2(ins_in[2]), .Y(n73) );
  AND2X1_HVT U33 ( .A1(n24), .A2(ins_in[1]), .Y(n76) );
  INVX0_HVT U34 ( .A(ps_in[1]), .Y(n31) );
  NAND2X0_HVT U35 ( .A1(ps_in[0]), .A2(n31), .Y(n28) );
  INVX0_HVT U36 ( .A(ins_in[0]), .Y(n25) );
  NAND2X0_HVT U37 ( .A1(n28), .A2(n25), .Y(n78) );
  XOR2X1_HVT U38 ( .A1(n64), .A2(pc_out[15]), .Y(n26) );
  XOR2X1_HVT U39 ( .A1(n27), .A2(n26), .Y(n30) );
  NAND2X0_HVT U40 ( .A1(n29), .A2(n28), .Y(n82) );
  NAND2X0_HVT U41 ( .A1(n30), .A2(n82), .Y(n35) );
  AND2X1_HVT U42 ( .A1(ps_in[0]), .A2(ps_in[1]), .Y(n80) );
  NAND2X0_HVT U43 ( .A1(n80), .A2(ra_in[15]), .Y(n34) );
  AND2X1_HVT U44 ( .A1(n32), .A2(n31), .Y(n79) );
  NAND2X0_HVT U45 ( .A1(pc_out[15]), .A2(n79), .Y(n33) );
  NAND3X0_HVT U46 ( .A1(n35), .A2(n34), .A3(n33), .Y(n6) );
  FADDX1_HVT U47 ( .A(pc_out[14]), .B(n64), .CI(n36), .CO(n27), .S(n38) );
  AO22X1_HVT U48 ( .A1(n80), .A2(ra_in[14]), .A3(pc_out[14]), .A4(n79), .Y(n37) );
  AO21X1_HVT U49 ( .A1(n38), .A2(n82), .A3(n37), .Y(n7) );
  FADDX1_HVT U50 ( .A(pc_out[13]), .B(n64), .CI(n39), .CO(n36), .S(n41) );
  AO22X1_HVT U51 ( .A1(n80), .A2(ra_in[13]), .A3(pc_out[13]), .A4(n79), .Y(n40) );
  AO21X1_HVT U52 ( .A1(n41), .A2(n82), .A3(n40), .Y(n8) );
  FADDX1_HVT U53 ( .A(pc_out[12]), .B(n64), .CI(n42), .CO(n39), .S(n44) );
  AO22X1_HVT U54 ( .A1(n80), .A2(ra_in[12]), .A3(pc_out[12]), .A4(n79), .Y(n43) );
  AO21X1_HVT U55 ( .A1(n44), .A2(n82), .A3(n43), .Y(n9) );
  FADDX1_HVT U56 ( .A(pc_out[11]), .B(n64), .CI(n45), .CO(n42), .S(n47) );
  AO22X1_HVT U57 ( .A1(n80), .A2(ra_in[11]), .A3(pc_out[11]), .A4(n79), .Y(n46) );
  AO21X1_HVT U58 ( .A1(n47), .A2(n82), .A3(n46), .Y(n10) );
  FADDX1_HVT U59 ( .A(pc_out[10]), .B(n64), .CI(n48), .CO(n45), .S(n50) );
  AO22X1_HVT U60 ( .A1(n80), .A2(ra_in[10]), .A3(pc_out[10]), .A4(n79), .Y(n49) );
  AO21X1_HVT U61 ( .A1(n50), .A2(n82), .A3(n49), .Y(n11) );
  FADDX1_HVT U62 ( .A(pc_out[9]), .B(n64), .CI(n51), .CO(n48), .S(n53) );
  AO22X1_HVT U63 ( .A1(n80), .A2(ra_in[9]), .A3(pc_out[9]), .A4(n79), .Y(n52)
         );
  AO21X1_HVT U64 ( .A1(n53), .A2(n82), .A3(n52), .Y(n12) );
  FADDX1_HVT U65 ( .A(pc_out[8]), .B(n64), .CI(n54), .CO(n51), .S(n56) );
  AO22X1_HVT U66 ( .A1(n80), .A2(ra_in[8]), .A3(pc_out[8]), .A4(n79), .Y(n55)
         );
  AO21X1_HVT U67 ( .A1(n56), .A2(n82), .A3(n55), .Y(n13) );
  FADDX1_HVT U68 ( .A(pc_out[7]), .B(n64), .CI(n57), .CO(n54), .S(n59) );
  AO22X1_HVT U69 ( .A1(n80), .A2(ra_in[7]), .A3(pc_out[7]), .A4(n79), .Y(n58)
         );
  AO21X1_HVT U70 ( .A1(n59), .A2(n82), .A3(n58), .Y(n14) );
  FADDX1_HVT U71 ( .A(pc_out[6]), .B(n64), .CI(n60), .CO(n57), .S(n62) );
  AO22X1_HVT U72 ( .A1(n80), .A2(ra_in[6]), .A3(pc_out[6]), .A4(n79), .Y(n61)
         );
  AO21X1_HVT U73 ( .A1(n62), .A2(n82), .A3(n61), .Y(n15) );
  FADDX1_HVT U74 ( .A(pc_out[5]), .B(n64), .CI(n63), .CO(n60), .S(n65) );
  AO222X1_HVT U75 ( .A1(n82), .A2(n65), .A3(n79), .A4(pc_out[5]), .A5(ra_in[5]), .A6(n80), .Y(n16) );
  FADDX1_HVT U76 ( .A(n67), .B(pc_out[4]), .CI(n66), .CO(n63), .S(n68) );
  AO222X1_HVT U77 ( .A1(n82), .A2(n68), .A3(n79), .A4(pc_out[4]), .A5(ra_in[4]), .A6(n80), .Y(n17) );
  FADDX1_HVT U78 ( .A(n70), .B(pc_out[3]), .CI(n69), .CO(n66), .S(n71) );
  AO222X1_HVT U79 ( .A1(n82), .A2(n71), .A3(n79), .A4(pc_out[3]), .A5(ra_in[3]), .A6(n80), .Y(n18) );
  FADDX1_HVT U80 ( .A(n73), .B(pc_out[2]), .CI(n72), .CO(n69), .S(n74) );
  AO222X1_HVT U81 ( .A1(n82), .A2(n74), .A3(n79), .A4(pc_out[2]), .A5(ra_in[2]), .A6(n80), .Y(n19) );
  FADDX1_HVT U82 ( .A(n76), .B(pc_out[1]), .CI(n75), .CO(n72), .S(n77) );
  AO222X1_HVT U83 ( .A1(n82), .A2(n77), .A3(n79), .A4(pc_out[1]), .A5(ra_in[1]), .A6(n80), .Y(n20) );
  HADDX1_HVT U84 ( .A0(n78), .B0(pc_out[0]), .C1(n75), .SO(n81) );
  AO222X1_HVT U85 ( .A1(n82), .A2(n81), .A3(n80), .A4(ra_in[0]), .A5(n79), 
        .A6(pc_out[0]), .Y(n21) );
endmodule

