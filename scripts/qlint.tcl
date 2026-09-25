source input/0_setup_design.tcl 

file delete -force qlint_work
vlib qlint_work
vmap work qlint_work

#################################################################
# Compilation
#################################################################

vlog +define+SYNTHESIS -sv [concat ${COMMON_FILES} ${RTL_FILES} ]

lint methodology ip -goal release
lint run -d $DESIGN_NAME

lint generate report
exec cp output/qlint/lint.rpt ../reports/${DESIGN_NAME}.rtl.qlint_report.txt
