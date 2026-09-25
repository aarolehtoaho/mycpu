#####################################################################################
#
# QuestaSim script fo gate-level simulation for DT2 labs
#
#####################################################################################


#####################################################################################
# 1. SETUP SECTION
#####################################################################################

#set REF_LIB_PATH /usr/local/contrib/nangate/NANGate_45nm
#set VERILOG_LIBRARY $REF_LIB_PATH/NangateOpenCellLibrary_PDKv1_3_v2010_12/Front_End/Verilog/NangateOpenCellLibrary.v

set REF_LIB_PATH $env(REF_LIB_PATH)

set VERILOG_LIBRARY $REF_LIB_PATH/verilog/saed32nm_hvt.v

set VSIM_GATELEVEL 1

vlib work
vmap work work
vlib glib
vmap glib glib

source input/0_setup_design.tcl 

#####################################################################################
# 2. COMPILATION
#####################################################################################

if { [info exists COMMON_FILES ] } {
    eval vlog -work work ${COMMON_FILES}
}

if { [info exists SVA_FILES ] } {
    eval vlog -work work ${SVA_FILES}
}

if { [info exists RTL_FILES ] } {
    eval vlog -work work ${RTL_FILES}
}

vlog -work glib $VERILOG_LIBRARY

# Compile gate-level netlist created by Design Vision to work

vlog -work glib -timescale 1ns/1ps results/${DESIGN_NAME}_gatelevel.v

# Compile testbench to 'work'

eval vlog -work work -timescale 1ns/1ps ${COMMON_FILES} ${TESTBENCH_FILES}

# Compile simulation configuration to 'work'

eval vlog -sv -work work -timescale 1ns/1ps input/glsim_cfg.sv

#####################################################################################
# 3. SIMULATION
#####################################################################################

# Launch simulator (backannotate typical delay from SDF file, and load testbench)

vsim +nowarn3448 +nowarn8756 +nowarnTFMPC \
    -t 1ps \
    -msgmode both \
    -debugdb \
    -voptargs="+acc" \
    -sdftyp /${DESIGN_NAME}_tb/DUT=results/${DESIGN_NAME}_gatelevel.sdf \
    -sdfnoerror \
    -GDUT_VS_REF_SIMULATION=1 \
    work.glsim_cfg

# Add ports to Wave windows
log -r /*

source input/vsim_waves.tcl

# Simulate

run -all

# Zoom to results

wave zoom full


