source input/0_setup_design.tcl 

check_superlint -init
clear -all

config_rtlds -rule  -enable -category {CONNECTIVITY SIM_SYNTH SYNTHESIS STRUCTURAL RACES INTEGRATION} 

foreach filename [concat ${COMMON_FILES} ${RTL_FILES} ] {
    analyze -sv +define+SYNTHESIS $filename
}

elaborate -disable_auto_bbox -top $DESIGN_NAME

get_design_info

clock -infer

reset -none

check_superlint -extract

check_superlint -prove
