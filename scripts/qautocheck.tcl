set QUESTA_TIMEOUT 5m

source input/0_setup_design.tcl 

set QUESTA_DIRECTIVES "input/${DESIGN_NAME}.questa.tcl"

file delete -force output/qautocheck
file delete -force qautocheck_work
file delete -force ../reports/${DESIGN_NAME}.rtl.qautocheck_report.txt

vlib qautocheck_work
vmap work qautocheck_work

#################################################################
# Compilation
#################################################################

vlog -mfcu [concat ${COMMON_FILES} ${RTL_FILES} ]

autocheck enable

if { [file exists $QUESTA_DIRECTIVES ] == 1 } {
    source $QUESTA_DIRECTIVES
}

autocheck compile -d ${DESIGN_NAME}

if { [info exists QUESTA_INIT_FILE] } {
    formal init -file ${QUESTA_INIT_FILE}
} else {
    formal init -inferred
}

autocheck verify -timeout $QUESTA_TIMEOUT

autocheck generate report
file copy -force  output/qautocheck_run_log/autocheck_verify.rpt  ../reports/${DESIGN_NAME}.rtl.qautocheck_report.txt











