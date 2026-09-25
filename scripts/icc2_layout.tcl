#################################################################
# Customizable variables
#################################################################

set INSERT_SCAN_CHAINS                      0
set RTL_POWER_ESTIMATION                    1
set ICC2_STANDARD_CELL_DENSITY              0.7
set ICC2_PNS_POWER_BUDGET                   1
set ICC2_PNS_VDD_VOLTAGE                    0.95
set ICC2_FLOORPLAN_ASPECT_RATIO             { 1.0 1.0}
set ICC2_FLOORPLAN_CORE_OFFSET              2
set ICC2_CTS_MAX_TRANSITION_WORST           0.15
set ICC2_CTS_MAX_CAPACITANCE_WORST          0.2
set ICC2_CTS_MAX_TRANSITION_BEST            0.15
set ICC2_CTS_MAX_CAPACITANCE_BEST           0.3
set ICC2_CTS_TARGET_SKEW_WORST              0.05
set ICC2_CTS_TARGET_SKEW_BEST               0.05
set ICC2_SIGNOFF_RUN_DRC 0
set ICC2_SIGNOFF_DRC_RULES                  { "M2*" "M3*" "M4*" }
set ICC2_CORE_RING_LAYER_H                  M9
set ICC2_CORE_RING_LAYER_V                  M8
set ICC2_CORE_RING_WIDTH_H                  8
set ICC2_CORE_RING_WIDTH_V                  10
set ICC2_CORE_RING_SPACING_H                 5
set ICC2_CORE_RING_SPACING_V                 5
set ICC2_CORE_RING_OFFSET_H                  2
set ICC2_CORE_RING_OFFSET_V                  2
set ICC2_POWER_MESH_LAYER_H                 M9
set ICC2_POWER_MESH_PITCH_H                 20 
set ICC2_POWER_MESH_WIDTH_H                  5 
set ICC2_POWER_MESH_LAYER_V                 M8
set ICC2_POWER_MESH_PITCH_V                 20 
set ICC2_POWER_MESH_WIDTH_V                  5 
set ICC2_STDCELL_RAIL_LAYERS             { M1 }
set ICC2_STDCELL_RAIL_WIDTH             0.056; # From library databook

#################################################################
# Technology settings
#################################################################

set REF_LIB_PATH                       $env(REF_LIB_PATH)

set ICC2_TECH_FILE                     "${REF_LIB_PATH}/tech/milkyway/saed32nm_1p9m_mw.tf"  ;#  Milkyway technology file
set ICC2_TLUPLUS_MAP_FILE              "${REF_LIB_PATH}/tech/star_rcxt/saed32nm_tf_itf_tluplus.map"  ;#  Mapping file for TLUplus
set ICC2_TLUPLUS_MAX_FILE              "${REF_LIB_PATH}/tech/star_rcxt/saed32nm_1p9m_Cmax.tluplus"  ;#  Max TLUplus file
set ICC2_TLUPLUS_MIN_FILE              "${REF_LIB_PATH}/tech/star_rcxt/saed32nm_1p9m_Cmin.tluplus"  ;#  Min TLUplus file
set ICC2_REFERENCE_LIBRARY             "$REF_LIB_PATH/stdcell_lib/saed32_hvt.ndm" 
set TCL_TECH_SETUP_FILE		       "${REF_LIB_PATH}/tech/tech_setup.tcl"
set TCL_ANTENNA_RULE_FILE	       "${REF_LIB_PATH}/tech/saed32nm_ant_1p9m.tcl"
set ICV_DRC_RULE_FILE	               "${REF_LIB_PATH}/tech/icv_drc/saed32nm_1p9m_drc_rules.rs"
set ICV_METAL_FILL_RULE_FILE	       "${REF_LIB_PATH}/tech/icv_drc/saed32nm_1p9m_mfill_rules.rs"
set ICC2_TIE_LIB_CELL_PATTERN_LIST    "*/TIE*"	
set ICC2_CTS_LIB_CELL_PATTERN_LIST    "*/NBUFF*HVT  */INVX*_HVT */CG*  */AOINV* */*DFF*"
set ICC2_SIGNOFF_SH_FILLERS           "*/SHFILL128_HVT */SHFILL64_HVT */SHFILL3_HVT */SHFILL2_HVT */SHFILL1_HVT"

# Useful constants
set tilew 0.152
set tileh 1.672
array set pitch [list {M1} {0.152} {M2} {0.152} {M3} {0.304} {M4} {0.304} {M5} {0.608} \
		      {M6} {0.608} {M7} {1.216} {M8} {1.216} {M9} {2.432} {MRDL} {4.864} ]
array set minw  [list {M1} {0.05}  {M2} {0.056} {M3} {0.056} {M4} {0.056} {M5} {0.056} \
                      {M6} {0.056} {M7} {0.056} {M8} {0.056} {M9} {0.16}  {MRDL} {2} ]
array set mins  [list {M1} {0.05}  {M2} {0.056} {M3} {0.056} {M4} {0.056} {M5} {0.056} \
                      {M6} {0.056} {M7} {0.056} {M8} {0.056} {M9} {0.16}  {MRDL}  {2} ]
array set maxw  [list {M1} {5}     {M2} {5}     {M3} {5}     {M4} {5}     {M5} {5} \
                      {M6} {5}     {M7} {5}     {M8} {5}     {M9} {10}    {MRDL} {30} ]

#################################################################
# Read design settings
#################################################################

set LAUNCH_DIR [pwd]
set ::env(LAUNCH_DIR) [pwd]
set DESIGN_DIR [pwd]
set INPUT_DIR "input"
set REPORTS_DIR "reports"
if { [file exists $REPORTS_DIR ] == 0 } {
    exec mkdir $REPORTS_DIR
}

set OUTPUT_DIR "output"
if { [file exists $OUTPUT_DIR ] == 0 } {
    exec mkdir $OUTPUT_DIR
}

set RESULTS_DIR "results"

source input/0_setup_design.tcl

set EDA_TOOL "ICC2"
set EDA_TOOL_TARGET "ASIC"


if { [info exists ICC2_SCAN_DEF_FILE ] == 0 } {
    set ICC2_SCAN_DEF_FILE ${RESULTS_DIR}/${DESIGN_NAME}_gatelevel.scandef
}

if { [info exists ICC2_IN_VERILOG_NETLIST_FILE ] == 0 } {
    set ICC2_IN_VERILOG_NETLIST_FILE ${RESULTS_DIR}/${DESIGN_NAME}_gatelevel.v
}


##########################################################################################################
# Create design lib
##########################################################################################################

set_message_info -id "CSTR-021" -limit 1
set_message_info -id "SDC-3" -limit 1

set DESIGN_LIBRARY ${DESIGN_NAME}.ndm
set DLIB ${OUTPUT_DIR}/${DESIGN_LIBRARY}

file delete -force $DLIB
create_lib -tech $ICC2_TECH_FILE -ref_libs $ICC2_REFERENCE_LIBRARY $DLIB

####################################################################################################################
# Read in design
####################################################################################################################

read_verilog -top ${DESIGN_NAME} ${ICC2_IN_VERILOG_NETLIST_FILE}
current_block
connect_pg_net -automatic -verbose

####################################################################################################################
# Set up timing
####################################################################################################################

read_parasitic_tech  -name maxTLU  -tlup $ICC2_TLUPLUS_MAX_FILE -layermap $ICC2_TLUPLUS_MAP_FILE
read_parasitic_tech  -name minTLU  -tlup $ICC2_TLUPLUS_MIN_FILE -layermap $ICC2_TLUPLUS_MAP_FILE
set_app_option -as -list {constraint.convert_from_bc_wc wc_only}
set_app_options -name time.enable_io_path_groups -value true 

# Create and set up one timing analysis corner, mode and scenario
create_corner SlowCorner
create_corner FastCorner

create_mode NormalMode
create_scenario -name NormalMode.SlowCorner -mode NormalMode -corner SlowCorner
create_scenario -name NormalMode.FastCorner -mode NormalMode -corner FastCorner

# Corner settings
current_corner SlowCorner
set_parasitic_parameters -early_spec maxTLU -late_spec maxTLU
set_temperature 125
set_process_number 1.00
set_process_label slow
set_voltage 0.95 -obj {VDD}
set_voltage 0.000 -obj {VSS}

current_corner FastCorner
set_parasitic_parameters -early_spec minTLU -late_spec minTLU
set_temperature -40
set_process_number 1.01
set_process_label fast
set_voltage 0.95 -obj {VDD}
set_voltage 0.000 -obj {VSS}

current_mode NormalMode
current_scenario NormalMode.SlowCorner

read_sdc  ${RESULTS_DIR}/${DESIGN_NAME}_gatelevel.sdc 

if { $INSERT_SCAN_CHAINS > 0} {
    read_def $ICC2_SCAN_DEF_FILE
} else {
    set_app_options  -name place.coarse.continue_on_missing_scandef -value true
}

if {[file exists $TCL_TECH_SETUP_FILE]} {
    source -echo $TCL_TECH_SETUP_FILE
} 

read_sdc  ${RESULTS_DIR}/${DESIGN_NAME}_gatelevel.sdc

if { $RTL_POWER_ESTIMATION == 1 } {
    saif_map -read_map ${RESULTS_DIR}/${DESIGN_NAME}_rtl.saifmap
    read_saif  -strip_path ${DESIGN_NAME}_tb/DUT_INSTANCE ${RESULTS_DIR}/${DESIGN_NAME}.saif
}

####################################################################################################################
# FLOORPLANNING
####################################################################################################################

initialize_floorplan \
    -core_offset $ICC2_FLOORPLAN_CORE_OFFSET \
    -shape Rect \
    -orientation N \
    -core_utilization $ICC2_STANDARD_CELL_DENSITY \
    -side_ratio $ICC2_FLOORPLAN_ASPECT_RATIO \
    -control_type core \
    -flip_first_row true \
    -coincident_boundary true

create_placement -floorplan
legalize_placement    

set_block_pin_constraints -self -allowed_layers {M3 M4 M5 M6}
place_pins -self
place_pins -self -legalize

##########################################################################################################################
# POWER NETWORK SYNTHESIS
##########################################################################################################################

# 1. Core Ring
set PNS_CORE_RING_LAYER_H             $ICC2_CORE_RING_LAYER_H
set PNS_CORE_RING_WIDTH_H             [expr $ICC2_CORE_RING_WIDTH_H  * $::minw($PNS_CORE_RING_LAYER_H)]
set PNS_CORE_RING_SPACING_H           [expr $ICC2_CORE_RING_SPACING_H * $::mins($PNS_CORE_RING_LAYER_H)]
set PNS_CORE_RING_OFFSET_H            [expr $ICC2_CORE_RING_OFFSET_H  * $::mins($PNS_CORE_RING_LAYER_H)]
set PNS_CORE_RING_LAYER_V             $ICC2_CORE_RING_LAYER_V
set PNS_CORE_RING_WIDTH_V             [expr $ICC2_CORE_RING_WIDTH_V   *  $::minw($PNS_CORE_RING_LAYER_V)]
set PNS_CORE_RING_SPACING_V           [expr $ICC2_CORE_RING_SPACING_V * $::mins($PNS_CORE_RING_LAYER_V)]
set PNS_CORE_RING_OFFSET_V            [expr $ICC2_CORE_RING_OFFSET_V  * $::mins($PNS_CORE_RING_LAYER_V)]


# 2. Horizontal (H) and Vertical (V) Power Straps ("mesh")
set PNS_POWER_MESH_LAYER_H         $ICC2_POWER_MESH_LAYER_H
set PNS_POWER_MESH_PITCH_H         [expr $ICC2_POWER_MESH_PITCH_H * $::pitch($PNS_POWER_MESH_LAYER_H)]
set PNS_POWER_MESH_WIDTH_H         [expr $ICC2_POWER_MESH_WIDTH_H * $::minw($PNS_POWER_MESH_LAYER_H)]
set PNS_POWER_MESH_LAYER_V         $ICC2_POWER_MESH_LAYER_V
set PNS_POWER_MESH_PITCH_V         [expr $ICC2_POWER_MESH_PITCH_V * $::pitch($PNS_POWER_MESH_LAYER_V)]
set PNS_POWER_MESH_WIDTH_V         [expr $ICC2_POWER_MESH_WIDTH_V * $::minw($PNS_POWER_MESH_LAYER_V)]

# 3. Standard cell rails
set PNS_STDCELL_RAIL_LAYERS        $ICC2_STDCELL_RAIL_LAYERS
set PNS_STDCELL_RAIL_WIDTH         $ICC2_STDCELL_RAIL_WIDTH

# PNS STRATEGY DEFINITIONS

remove_pg_strategies -all
remove_pg_patterns -all
remove_pg_regions -all
remove_pg_via_master_rules -all
remove_pg_strategy_via_rules -all
remove_routes -net_types {power ground} -ring -stripe -macro_pin_connect -lib_cell_pin_connect > /dev/null
#set_app_options -name plan.pgroute.drc_check_fast_mode -value true
suppress_message PGR-599

# 1. Create core_ring

create_pg_ring_pattern core_ring_pat \
    -horizontal_layer $PNS_CORE_RING_LAYER_H \
    -horizontal_width $PNS_CORE_RING_WIDTH_H \
    -horizontal_spacing $PNS_CORE_RING_SPACING_H \
    -vertical_layer   $PNS_CORE_RING_LAYER_V \
    -vertical_width   $PNS_CORE_RING_WIDTH_V \
    -vertical_spacing   $PNS_CORE_RING_SPACING_V \
    -via_rule {{intersection:adjacent}{via_master:VIA78LG}} \
    -corner_bridge true

set_pg_strategy core_ring_strat \
    -core \
    -pattern [list [list name: core_ring_pat] [list nets: {VDD VSS}] [list offset: [list $PNS_CORE_RING_OFFSET_H $PNS_CORE_RING_OFFSET_H]] ] 

compile_pg -strategies { core_ring_strat } -tag core_ring

# 2. Create power mesh and connect it to ring

# Define mesh layers as temp variables, otherwise the command will be a mess :-)

set lv [list [list vertical_layer:   $PNS_POWER_MESH_LAYER_V] \
	     [list width: $PNS_POWER_MESH_WIDTH_V] \
	     [list spacing: interleaving] \
	     [list pitch: $PNS_POWER_MESH_PITCH_V] ]

set lh [list [list horizontal_layer: $PNS_POWER_MESH_LAYER_H] \
	     [list width: $PNS_POWER_MESH_WIDTH_H] \
	     [list spacing: interleaving] \
	     [list pitch: $PNS_POWER_MESH_PITCH_H] ]

create_pg_mesh_pattern mesh_pat -layers [list $lv $lh]

set_pg_strategy mesh_strat -core \
    -extension {{stop: outermost_ring}} \
    -pattern {{pattern: mesh_pat} {nets: {VDD VSS}}}\
    -blockage {{nets: VSS VDD}{ macros: $macros }}

set_pg_strategy_via_rule mesh_vias_strat \
	-via_rule { 
	    { {{strategies: mesh_strat}} {{tags: {core_ring}}} {via_master: default} } \
		{ {intersection: undefined}{via_master: NIL} } \
	}

compile_pg -strategies { mesh_strat } -via_rule mesh_vias_strat -tag mesh

# 3. Create standard cell rails

create_pg_std_cell_conn_pattern rail_pat \
    -layers $PNS_STDCELL_RAIL_LAYERS \
    -rail_width $PNS_STDCELL_RAIL_WIDTH 

set_pg_strategy rail_strat -core \
    -pattern {{pattern: rail_pat} {nets: VDD VSS}} \
    -extension {{stop: outermost_ring}} \
    -blockage {{{macros_with_keepout:  $macros }}}

set_pg_via_master_rule via_rule_pg_rail \
    -via_array_dimension {3 1} \
    -contact_code {VIA12SQ VIA23SQ VIA34SQ VIA45SQ VIA56SQ VIA67SQ VIA78SQ}

# Notice: The following (intersection with mesh_strat) does not work as in Synopsys examples:
#  { {{strategies: rail_strat }} {{strategies: mesh_strat}} {via_master: via_rule_pg_rail} } 
# We use tags instead. Maybe this would work if we compiled everything together.

set_pg_strategy_via_rule rail_to_M8 \
    -via_rule { \
		    { {{strategies: rail_strat } {layers M1 }} {{tags: { core_ring mesh }} {layers: M8 }} {via_master: via_rule_pg_rail} } \
		    { {intersection: undefined}{via_master: NIL }} \
		}

compile_pg -strategies { rail_strat } -via_rule {rail_to_M8}


##########################################################################################################################
# PLACEMENT
##########################################################################################################################

set_lib_cell_purpose -include optimization [get_lib_cells $ICC2_TIE_LIB_CELL_PATTERN_LIST]
set_dont_touch [get_lib_cells $ICC2_TIE_LIB_CELL_PATTERN_LIST] false
set_app_options -list {opt.tie_cell.max_fanout 8}

place_opt

check_legality
check_mv_design

##########################################################################################################################
# CLOCK TREE SYNTHESIS (CTS)
##########################################################################################################################

# Select CTS cells to be used
set CTS_CELLS [get_lib_cells $ICC2_CTS_LIB_CELL_PATTERN_LIST]
set_dont_touch $CTS_CELLS false
suppress_message ATTR-12
set_lib_cell_purpose -exclude cts [get_lib_cells] 
set_lib_cell_purpose -include cts $CTS_CELLS
unsuppress_message ATTR-12

# Add clock constraints to mode and scenario
current_scenario NormalMode.SlowCorner
#set_max_transition  $ICC2_CTS_MAX_TRANSITION_WORST  -clock_path { clk }
#set_max_capacitance $ICC2_CTS_MAX_CAPACITANCE_WORST -clock_path { clk } -corners { SlowCorner }
set_clock_tree_options -target_skew $ICC2_CTS_TARGET_SKEW_WORST  -clocks { clk } -corner SlowCorner

current_scenario NormalMode.FastCorner
#set_max_transition  $ICC2_CTS_MAX_TRANSITION_BEST -clock_path { clk }
#set_max_capacitance $ICC2_CTS_MAX_CAPACITANCE_BEST -clock_path { clk } -corners { SlowCorner }
set_clock_tree_options -target_skew $ICC2_CTS_TARGET_SKEW_BEST  -clocks { clk } -corner FastCorner

check_clock_trees

# Synthesize clock tree

set_app_options -name clock_opt.place.effort -value medium; # medium, high

clock_opt 

##########################################################################################################################
# ROUTING
##########################################################################################################################


set_app_options -name route.common.verbose_level -value 1
check_design -checks pre_route_stage
set_app_options -name route.common.verbose_level -value 0

#  Read antennal rules
if {$TCL_ANTENNA_RULE_FILE != ""} {
    source -echo $TCL_ANTENNA_RULE_FILE
}

#  Set application options for the specific routers
set_app_options -list {
  route.global.timing_driven true
  route.global.crosstalk_driven false
  route.track.timing_driven true
  route.track.crosstalk_driven true
  route.detail.timing_driven true
  route.detail.force_max_number_iterations false }

# Run global routing, track assignment, and detail routing in  one step.
current_scenario NormalMode.SlowCorner

route_auto

# Check routing
check_routes

# Optimize routing
route_opt

##########################################################################################################################
# FINISHING
##########################################################################################################################

# Create filler cells and connect them to power and ground nets
create_stdcell_fillers -lib_cells $ICC2_SIGNOFF_SH_FILLERS
connect_pg_net 
remove_stdcell_fillers_with_violation

# Design Rules Check (DRC) with IC Validator In-Design

if { $ICC2_SIGNOFF_RUN_DRC == 1 } {
    set_app_options -name signoff.check_drc.runset              -value $ICV_DRC_RULE_FILE
    set_app_options -name signoff.check_drc.max_errors_per_rule -value 1000
    set_app_options -name signoff.check_drc.run_dir             -value "z_icvDRC_run"
    
    signoff_check_drc -select_rules $ICC2_SIGNOFF_DRC_RULES
    
    save_lib

    set_app_options -list {signoff.fix_drc.init_drc_error_db "z_icvDRC_run"}
    signoff_fix_drc
}

##########################################################################################################################
# ICV In-Design Metal Fill
##########################################################################################################################

# set_app_options -name signoff.create_metal_fill.runset -value $ICV_METAL_FILL_RULE_FILE
# signoff_create_metal_fill


##########################################################################################################################
# Export data
##########################################################################################################################

write_parasitics -corner SlowCorner -format spef -output  ${RESULTS_DIR}/${DESIGN_NAME}_postlayout
write_parasitics -corner FastCorner -format spef -output  ${RESULTS_DIR}/${DESIGN_NAME}_postlayout

exec cp "${RESULTS_DIR}/${DESIGN_NAME}_postlayout.minTLU_-40.spef" ${RESULTS_DIR}/${DESIGN_NAME}_postlayout.spef
write_verilog  ${RESULTS_DIR}/${DESIGN_NAME}_postlayout.v
write_sdc -output ${RESULTS_DIR}/${DESIGN_NAME}_postlayout.sdc

##########################################################################################################################
# Reports
##########################################################################################################################

current_scenario NormalMode.SlowCorner
update_timing -full

report_qor -summary                                                 > ${REPORTS_DIR}/${DESIGN_NAME}.postlayout_qor.txt
report_timing -report_by group -scenarios { NormalMode.SlowCorner } > ${REPORTS_DIR}/${DESIGN_NAME}.postlayout_timing_setup.txt
report_power                                                        > ${REPORTS_DIR}/${DESIGN_NAME}.postlayout_power.txt
report_clock_qor                                                    > ${REPORTS_DIR}/${DESIGN_NAME}.postlayout_clock_qor.txt

save_lib -all
