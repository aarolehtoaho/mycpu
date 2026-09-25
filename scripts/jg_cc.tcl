#################################################################
# Read settings
#################################################################

source input/0_setup_design.tcl 

if { [info exists JASPER_CONNECTIVITY_TABLE] == 0 } {
    set JASPER_CONNECTIVITY_TABLE "input/${DESIGN_NAME}.jgcc.csv"
}

#####################################################################################
#  RTL HDL INPUT
#####################################################################################

foreach filename [concat ${COMMON_FILES} ${RTL_FILES} ] {
    set ext [file extension $filename]
    if { $ext == ".vhd" } {
	eval "analyze -vhdl08 $filename"
    } elseif { $ext == ".sv" } {
	eval "analyze -sv +define+design_top_is_${DESIGN_NAME} +define+MULTICLOCK_PROPERTIES_UNSUPPORTED $filename"
    } elseif { $ext == ".v" } {
	eval "analyze -v2k +define+design_top_is_${DESIGN_NAME} $filename"
    }
}

elaborate -disable_auto_bbox -top $DESIGN_NAME

get_design_info

#####################################################################################
#  Clocks and resets
#####################################################################################

clock clk
reset ~rst_n

#####################################################################################
#  Verification
#####################################################################################

check_conn -load $JASPER_CONNECTIVITY_TABLE
check_conn -prove

#####################################################################################
#  Reports
#####################################################################################

report -force -file reports/${DESIGN_NAME}.rtl.jg_cc_report.txt


