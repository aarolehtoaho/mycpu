#####################################################################################
#
# QuestaSim simulation script for DT2 project
#
#####################################################################################

if { [runStatus] != "nodesign" } { quit -sim }

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

transcript file reports/${DESIGN_NAME}.rtl.simulation_log.txt
set PrefSource(OpenOnFinsh) 0
set PrefSource(AutoReloadModifiedFiles) 1

#####################################################################################
# 2. COMPILATION (ANALYSIS)
#####################################################################################

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

vdir -l

#####################################################################################
# 3. ELABORATION
#####################################################################################

# Code optimization
eval vopt ${VOPT_SETTINGS} ${DESIGN_NAME}_tb -o ${DESIGN_NAME}_opt

# Elaboration
eval vsim ${VSIM_SETTINGS} ${DESIGN_NAME}_opt

# Set up data logging (log all data)
add log -r /*

# Setup and configure Wave window
source input/vsim_waves.tcl

# Start switching activity recording
power add -r /${DESIGN_NAME}_tb/DUT/*
power on -r /${DESIGN_NAME}_tb/DUT/*

# Prevent $finish from killing simulator in batch mode
if [batch_mode] {
    onfinish stop
}

#####################################################################################
# 4. SIMULATION
#####################################################################################

# Simulate
echo "-------------------------------------------------------------------------------"
echo "SIMULATION START [clock format [clock seconds] -format %D:%H:%M:%S] $env(USER)"
echo "-------------------------------------------------------------------------------"
run $RTL_SIMULATION_TIME
set assert_errors [assertion count -fails -lang sva -r /]
echo "-------------------------------------------------------------------------------"
echo "SIMULATION END (${assert_errors} assertions failed)"
echo "-------------------------------------------------------------------------------"

# Zoom to results
wave zoom full

# Write out activity file in SAIF format
power report -bsaif results/${DESIGN_NAME}.saif

suppress 19063
coverage report -instance=/${DESIGN_NAME}_tb/DUT -recursive -output reports/${DESIGN_NAME}.rtl.simulation_coverage.txt
coverage report -assert -details -output reports/${DESIGN_NAME}.rtl.assertions.txt



if [batch_mode] {
    exit
}


