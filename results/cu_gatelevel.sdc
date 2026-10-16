###################################################################

# Created by write_sdc on Thu Oct 15 15:19:42 2026

###################################################################
set sdc_version 1.7

set_units -time ns -resistance MOhm -capacitance fF -voltage V -current uA
create_clock [get_ports clk]  -period 4.25  -waveform {0 2.125}
set_input_delay -clock clk  0  [get_ports rst_n]
