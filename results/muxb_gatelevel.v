/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Ultra(TM) in wire load mode
// Version   : T-2022.03-SP5-1
// Date      : Tue Sep  8 12:42:14 2026
/////////////////////////////////////////////////////////////


module muxb ( sel_in, d0_in, d1_in, m_out );
  input [15:0] d0_in;
  input [15:0] d1_in;
  output [15:0] m_out;
  input sel_in;
  wire   n2;

  INVX2_HVT U19 ( .A(sel_in), .Y(n2) );
  AO22X1_HVT U20 ( .A1(sel_in), .A2(d1_in[0]), .A3(n2), .A4(d0_in[0]), .Y(
        m_out[0]) );
  AO22X1_HVT U21 ( .A1(sel_in), .A2(d1_in[1]), .A3(n2), .A4(d0_in[1]), .Y(
        m_out[1]) );
  AO22X1_HVT U22 ( .A1(sel_in), .A2(d1_in[2]), .A3(n2), .A4(d0_in[2]), .Y(
        m_out[2]) );
  AND2X1_HVT U23 ( .A1(d0_in[3]), .A2(n2), .Y(m_out[3]) );
  AND2X1_HVT U24 ( .A1(d0_in[4]), .A2(n2), .Y(m_out[4]) );
  AND2X1_HVT U25 ( .A1(d0_in[5]), .A2(n2), .Y(m_out[5]) );
  AND2X1_HVT U26 ( .A1(d0_in[6]), .A2(n2), .Y(m_out[6]) );
  AND2X1_HVT U27 ( .A1(d0_in[7]), .A2(n2), .Y(m_out[7]) );
  AND2X1_HVT U28 ( .A1(d0_in[8]), .A2(n2), .Y(m_out[8]) );
  AND2X1_HVT U29 ( .A1(d0_in[9]), .A2(n2), .Y(m_out[9]) );
  AND2X1_HVT U30 ( .A1(d0_in[10]), .A2(n2), .Y(m_out[10]) );
  AND2X1_HVT U31 ( .A1(d0_in[11]), .A2(n2), .Y(m_out[11]) );
  AND2X1_HVT U32 ( .A1(d0_in[12]), .A2(n2), .Y(m_out[12]) );
  AND2X1_HVT U33 ( .A1(d0_in[13]), .A2(n2), .Y(m_out[13]) );
  AND2X1_HVT U34 ( .A1(d0_in[14]), .A2(n2), .Y(m_out[14]) );
  AND2X1_HVT U35 ( .A1(d0_in[15]), .A2(n2), .Y(m_out[15]) );
endmodule

