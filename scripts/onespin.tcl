source input/0_setup_design.tcl 

foreach filename [concat ${COMMON_FILES} ${RTL_FILES} ] {
    read_verilog -sv -define { SYNTHESIS } ${filename}
}

elaborate -top $DESIGN_NAME

set_mode mv

check_consistency -category all
