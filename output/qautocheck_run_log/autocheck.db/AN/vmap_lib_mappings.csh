#!/bin/csh -f


set vlib_exec="/sw/rhel7/siemens/questa_cdc_formal-2022.4_1/linux_x86_64/share/modeltech/linux_x86_64/vlib"
if (! -e $vlib_exec) then
  echo "** ERROR: vlib path '$vlib_exec' does not exist"
  exit 1
endif

set vmap_exec="/sw/rhel7/siemens/questa_cdc_formal-2022.4_1/linux_x86_64/share/modeltech/linux_x86_64/vmap"
if (! -e $vmap_exec) then
  echo "** ERROR: vmap path '$vmap_exec' does not exist"
  exit 1
endif

