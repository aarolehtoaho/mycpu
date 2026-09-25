#####################################################################################
#
# QuestaSim compilaation and elaboration script for DT2 project
#
#####################################################################################

onerror quit

#####################################################################################
# 1. SETUP SECTION
#####################################################################################

set VLOG_RTL_OPTIONS   ""
set VOPT_RTL_OPTIONS   ""
set VSIM_RTL_OPTIONS   ""
set VLOG_SETTINGS      "-work work -timescale 1ns/1ps +cover=bcxefs"
set VOPT_SETTINGS      "-work work +acc -debugdb +cover=bcxefs -suppress 10587"
set VSIM_SETTINGS      "-work work +nowarnTSCALE -t 1ps -msgmode both -debugdb -fsmdebug -assertdebug -coverage"

# Create libraries and map paths to names

file delete -force work
vlib work
vmap work work

source input/0_setup_design.tcl 

set VLOG_SETTINGS [concat $VLOG_RTL_OPTIONS $VLOG_SETTINGS ]
set VOPT_SETTINGS [concat $VOPT_RTL_OPTIONS $VOPT_SETTINGS ]
set VSIM_SETTINGS [concat $VSIM_RTL_OPTIONS $VSIM_SETTINGS ]

#####################################################################################
# 2. COMPILATION (ANALYSIS)
#####################################################################################

echo "-------------------------------------------------------------------------------"
echo "COMPILATION START"
echo "-------------------------------------------------------------------------------"

if { [info exists COMMON_FILES ] } {
    eval vlog ${VLOG_SETTINGS} ${COMMON_FILES}
}

if { [info exists SVA_FILES ] } {
    eval vlog ${VLOG_SETTINGS} ${SVA_FILES}
}

if { [info exists RTL_FILES ] } {
    eval vlog ${VLOG_SETTINGS} ${RTL_FILES}
}

if { [info exists TESTBENCH_FILES ] } {
    eval vlog ${VLOG_SETTINGS} ${TESTBENCH_FILES}
}

echo "-------------------------------------------------------------------------------"
echo "COMPILATION END"
echo "-------------------------------------------------------------------------------"

vdir -l

#####################################################################################
# 3. ELABORATION
#####################################################################################

echo "-------------------------------------------------------------------------------"
echo "ELABORATION START"
echo "-------------------------------------------------------------------------------"

# Code optimization
eval vopt ${VOPT_SETTINGS} ${DESIGN_NAME}_tb -o ${DESIGN_NAME}_opt

# Elaboration
eval vsim ${VSIM_SETTINGS} ${DESIGN_NAME}_opt

echo "-------------------------------------------------------------------------------"
echo "ELABORATION END"
echo "-------------------------------------------------------------------------------"

quit

