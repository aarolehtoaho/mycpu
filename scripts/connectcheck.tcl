source input/0_setup_design.tcl 

set QUESTA_DIRECTIVES "input/${DESIGN_NAME}.questa.tcl"

file delete -force connectcheck_work
vlib connectcheck_work
vmap work connectcheck_work
file delete -force reports/${DESIGN_NAME}.rtl.connectcheck_report.txt

#################################################################
# Compilation
#################################################################

vlog -mfcu -sv [concat ${COMMON_FILES} ${RTL_FILES} ]

#if { [file exists $QUESTA_DIRECTIVES ] == 1 } {
#    source $QUESTA_DIRECTIVES
#}

namespace import ConnectCheck::*
connectcheck elaborate -d ${DESIGN_NAME}
connectcheck load csv input/${DESIGN_NAME}.connectcheck.csv
if { [info exists QUESTA_INIT_FILE] } {
    formal init -file ${QUESTA_INIT_FILE}
} else {
    formal init -inferred
}
connectcheck compile

connectcheck verify -exclude_cover

file copy -force output/connectcheck/formal_verify.rpt reports/${DESIGN_NAME}.rtl.connectcheck_report.txt


