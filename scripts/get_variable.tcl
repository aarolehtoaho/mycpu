#!/usr/bin/tclsh

source input/0_setup_design.tcl 

if { $argc == 1 } {
    set varname [lindex $argv 0]
    set chan [open output/variable w]
    if { [info exists $varname] == 1 } {
	puts [set $varname]
	puts $chan [set $varname]
    } else {
	puts ""
	puts $chan ""
    }
    close $chan
}
