##########################################################################################################################
#
# SETUP SECTION
#
##########################################################################################################################

source input/0_setup_design.tcl

set REF_LIB_PATH $env(REF_LIB_PATH)
set GATE_LIBRARIES [list ${REF_LIB_PATH}/logic_lib/saed32hvt_tt1p05v25c.db  ]

set synopsys_auto_setup true
set_svf results/${DESIGN_NAME}.svf

##########################################################################################################################
#
# REFERENCE DESIGN IMPORT
#
##########################################################################################################################

# Read in reference design (RTL)

read_sverilog -container r -libname WORK [concat $COMMON_FILES $RTL_FILES]

set_top r:/WORK/${DESIGN_NAME} 

##########################################################################################################################
#
# IMPLEMENTATION DESIGN IMPORT
#
##########################################################################################################################

# Read in implementation design (gate-level)

read_db -container i ${GATE_LIBRARIES}

read_verilog -container i -libname WORK  "results/${DESIGN_NAME}_gatelevel.v" 

set_top i:/WORK/${DESIGN_NAME}

##########################################################################################################################
#
# LOGICAL EQUIVALENCE CHECK
#
##########################################################################################################################

# Find compare points

match 

# Check equivalence of reference and implementation models

verify

##########################################################################################################################
#
# WRITE OUT RESULTS
#
##########################################################################################################################

report_status > reports/${DESIGN_NAME}.gatelevel.lec_status.txt

#save_session -replace results/${DESIGN_NAME}.fm

start_gui

