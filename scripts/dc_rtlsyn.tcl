##########################################################################################################################
#
# SETUP SECTION
#
##########################################################################################################################

remove_design -all

set REF_LIB_PATH       $env(REF_LIB_PATH)
set DC_ALIB_PATH       "${REF_LIB_PATH}/logic_lib/alib-52"
set search_path        "${REF_LIB_PATH}/logic_lib $search_path"
set target_library     "saed32hvt_tt1p05v25c.db"
set synthetic_library  "dw_foundation.sldb"
set link_library       "* saed32hvt_tt1p05v25c.db dw_foundation.sldb"

set_app_var alib_library_analysis_path $DC_ALIB_PATH
set_app_var hdlin_reporting_level      verbose

saif_map -start

define_design_lib WORK -path output/synopsys_work

source input/0_setup_design.tcl 

set sh_output_log_file reports/${DESIGN_NAME}.rtl.synthesis_log.txt

suppress_message "VO-4" ;  # Ignore Warning: Verilog 'assign' or 'tran' statements are written out.
suppress_message "UCN-1" ; # Warning: In the design *, net * is connecting multiple ports. (UCN-1)

set_svf results/${DESIGN_NAME}.svf

set user $::env(USER)
set char  [string index $user 0]
scan $char %c numval
set derate [expr { 1.0 + ( ($numval-96.0) / 500 ) } ]
echo $derate
	    
##########################################################################################################################
#
# DESIGN IMPORT
#
##########################################################################################################################

analyze -library WORK -format sverilog ${COMMON_FILES}
analyze -library WORK -format sverilog ${RTL_FILES}
elaborate $DESIGN_NAME -library WORK

current_design ${DESIGN_NAME}

if { [ file exists $SDC_FILE] } {
    read_sdc $SDC_FILE
}

if { [info exists DC_DONT_UNGROUP] } {
    foreach design $DC_DONT_UNGROUP {
	set_ungroup $design false
    }
}

##########################################################################################################################
#
# OPTIMIZATION
#
##########################################################################################################################

set_timing_derate -max -late $derate

if { [info exists DC_COMPILE_COMMAND] } {
    eval "$DC_COMPILE_COMMAND"
} else {
    compile_ultra
}

##########################################################################################################################
#
# WRITE OUT RESULTS
#
##########################################################################################################################

report_timing

report_area -hierarchy > reports/${DESIGN_NAME}.gatelevel.area.txt
report_timing > reports/${DESIGN_NAME}.gatelevel.timing.txt
report_qor > reports/${DESIGN_NAME}.gatelevel.qor.txt
read_saif -auto_map_names -input results/${DESIGN_NAME}.saif -instance_name ${DESIGN_NAME}_tb/DUT -verbose
report_power > reports/${DESIGN_NAME}.gatelevel.power.txt
if { ${DESIGN_NAME} == "mycpu" } { report_power -hierarchy >> reports/${DESIGN_NAME}.gatelevel.power.txt }
report_reference  -hierarchy > reports/${DESIGN_NAME}.gatelevel.reference.txt

change_names -rules verilog -hierarchy

write -hierarchy -format verilog -output results/${DESIGN_NAME}_gatelevel.v

write_sdf -version 2.1 results/${DESIGN_NAME}_gatelevel.sdf
reset_timing_derate
write_sdc -version 1.7 results/${DESIGN_NAME}_gatelevel.sdc

saif_map -write_map results/${DESIGN_NAME}_rtl.saifmap

gui_start

gui_create_schematic

print_message_info

