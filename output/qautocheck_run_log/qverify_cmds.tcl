# do scripts/qautocheck.tcl
vlib qautocheck_work
vmap work qautocheck_work
vlog -mfcu {"input/mycpu_pkg.sv" input/pc.sv}
autocheck enable
autocheck compile -d pc
formal init -file input/questa_seq.tcl
autocheck verify -timeout 5m
autocheck generate report
# end do scripts/qautocheck.tcl
