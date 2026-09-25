/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Ultra(TM) in wire load mode
// Version   : T-2022.03-SP5-1
// Date      : Tue Sep  8 14:57:43 2026
/////////////////////////////////////////////////////////////


module muxd ( sel_in, d_in, m_out );
  input [1:0] sel_in;
  input [63:0] d_in;
  output [15:0] m_out;


  MUX41X1_HVT U17 ( .A1(d_in[0]), .A3(d_in[16]), .A2(d_in[32]), .A4(d_in[48]), 
        .S0(sel_in[0]), .S1(sel_in[1]), .Y(m_out[0]) );
  MUX41X1_HVT U18 ( .A1(d_in[1]), .A3(d_in[17]), .A2(d_in[33]), .A4(d_in[49]), 
        .S0(sel_in[0]), .S1(sel_in[1]), .Y(m_out[1]) );
  MUX41X1_HVT U19 ( .A1(d_in[2]), .A3(d_in[18]), .A2(d_in[34]), .A4(d_in[50]), 
        .S0(sel_in[0]), .S1(sel_in[1]), .Y(m_out[2]) );
  MUX41X1_HVT U20 ( .A1(d_in[3]), .A3(d_in[19]), .A2(d_in[35]), .A4(d_in[51]), 
        .S0(sel_in[0]), .S1(sel_in[1]), .Y(m_out[3]) );
  MUX41X1_HVT U21 ( .A1(d_in[4]), .A3(d_in[20]), .A2(d_in[36]), .A4(d_in[52]), 
        .S0(sel_in[0]), .S1(sel_in[1]), .Y(m_out[4]) );
  MUX41X1_HVT U22 ( .A1(d_in[5]), .A3(d_in[21]), .A2(d_in[37]), .A4(d_in[53]), 
        .S0(sel_in[0]), .S1(sel_in[1]), .Y(m_out[5]) );
  MUX41X1_HVT U23 ( .A1(d_in[6]), .A3(d_in[22]), .A2(d_in[38]), .A4(d_in[54]), 
        .S0(sel_in[0]), .S1(sel_in[1]), .Y(m_out[6]) );
  MUX41X1_HVT U24 ( .A1(d_in[7]), .A3(d_in[23]), .A2(d_in[39]), .A4(d_in[55]), 
        .S0(sel_in[0]), .S1(sel_in[1]), .Y(m_out[7]) );
  MUX41X1_HVT U25 ( .A1(d_in[8]), .A3(d_in[24]), .A2(d_in[40]), .A4(d_in[56]), 
        .S0(sel_in[0]), .S1(sel_in[1]), .Y(m_out[8]) );
  MUX41X1_HVT U26 ( .A1(d_in[9]), .A3(d_in[25]), .A2(d_in[41]), .A4(d_in[57]), 
        .S0(sel_in[0]), .S1(sel_in[1]), .Y(m_out[9]) );
  MUX41X1_HVT U27 ( .A1(d_in[10]), .A3(d_in[26]), .A2(d_in[42]), .A4(d_in[58]), 
        .S0(sel_in[0]), .S1(sel_in[1]), .Y(m_out[10]) );
  MUX41X1_HVT U28 ( .A1(d_in[11]), .A3(d_in[27]), .A2(d_in[43]), .A4(d_in[59]), 
        .S0(sel_in[0]), .S1(sel_in[1]), .Y(m_out[11]) );
  MUX41X1_HVT U29 ( .A1(d_in[12]), .A3(d_in[28]), .A2(d_in[44]), .A4(d_in[60]), 
        .S0(sel_in[0]), .S1(sel_in[1]), .Y(m_out[12]) );
  MUX41X1_HVT U30 ( .A1(d_in[13]), .A3(d_in[29]), .A2(d_in[45]), .A4(d_in[61]), 
        .S0(sel_in[0]), .S1(sel_in[1]), .Y(m_out[13]) );
  MUX41X1_HVT U31 ( .A1(d_in[14]), .A3(d_in[30]), .A2(d_in[46]), .A4(d_in[62]), 
        .S0(sel_in[0]), .S1(sel_in[1]), .Y(m_out[14]) );
  MUX41X1_HVT U32 ( .A1(d_in[15]), .A3(d_in[31]), .A2(d_in[47]), .A4(d_in[63]), 
        .S0(sel_in[0]), .S1(sel_in[1]), .Y(m_out[15]) );
endmodule

