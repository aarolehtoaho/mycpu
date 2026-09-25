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

cp -f /homedir01/alehtoah24/DT2_2026/project/workdir/output/qautocheck_run_log/autocheck.db/AN/modelsim.ini .

# $vlib_exec /homedir01/alehtoah24/DT2_2026/project/workdir/./qautocheck_work
if($status == 0) then
  $vmap_exec -modelsimini modelsim.ini work /homedir01/alehtoah24/DT2_2026/project/workdir/./qautocheck_work
else
  echo "** Error: Library mapping failed. (Command: 'vlib /homedir01/alehtoah24/DT2_2026/project/workdir/./qautocheck_work')"
endif
# $vlib_exec /sw/rhel7/siemens/questa_cdc_formal-2022.4_1/linux_x86_64/share/modeltech/linux_x86_64/../std
# if($status == 0) then
#   $vmap_exec -modelsimini modelsim.ini std /sw/rhel7/siemens/questa_cdc_formal-2022.4_1/linux_x86_64/share/modeltech/linux_x86_64/../std
# else
#   echo "** Error: Library mapping failed. (Command: 'vlib /sw/rhel7/siemens/questa_cdc_formal-2022.4_1/linux_x86_64/share/modeltech/linux_x86_64/../std')"
# endif
# $vlib_exec /sw/rhel7/siemens/questa_cdc_formal-2022.4_1/linux_x86_64/share/modeltech/linux_x86_64/../ieee
# if($status == 0) then
#   $vmap_exec -modelsimini modelsim.ini ieee /sw/rhel7/siemens/questa_cdc_formal-2022.4_1/linux_x86_64/share/modeltech/linux_x86_64/../ieee
# else
#   echo "** Error: Library mapping failed. (Command: 'vlib /sw/rhel7/siemens/questa_cdc_formal-2022.4_1/linux_x86_64/share/modeltech/linux_x86_64/../ieee')"
# endif
# $vlib_exec /sw/rhel7/siemens/questa_cdc_formal-2022.4_1/linux_x86_64/share/modeltech/linux_x86_64/../vital2000
# if($status == 0) then
#   $vmap_exec -modelsimini modelsim.ini vital2000 /sw/rhel7/siemens/questa_cdc_formal-2022.4_1/linux_x86_64/share/modeltech/linux_x86_64/../vital2000
# else
#   echo "** Error: Library mapping failed. (Command: 'vlib /sw/rhel7/siemens/questa_cdc_formal-2022.4_1/linux_x86_64/share/modeltech/linux_x86_64/../vital2000')"
# endif
# $vlib_exec /sw/rhel7/siemens/questa_cdc_formal-2022.4_1/linux_x86_64/share/modeltech/linux_x86_64/../verilog
# if($status == 0) then
#   $vmap_exec -modelsimini modelsim.ini verilog /sw/rhel7/siemens/questa_cdc_formal-2022.4_1/linux_x86_64/share/modeltech/linux_x86_64/../verilog
# else
#   echo "** Error: Library mapping failed. (Command: 'vlib /sw/rhel7/siemens/questa_cdc_formal-2022.4_1/linux_x86_64/share/modeltech/linux_x86_64/../verilog')"
# endif
# $vlib_exec /sw/rhel7/siemens/questa_cdc_formal-2022.4_1/linux_x86_64/share/modeltech/linux_x86_64/../std_developerskit
# if($status == 0) then
#   $vmap_exec -modelsimini modelsim.ini std_developerskit /sw/rhel7/siemens/questa_cdc_formal-2022.4_1/linux_x86_64/share/modeltech/linux_x86_64/../std_developerskit
# else
#   echo "** Error: Library mapping failed. (Command: 'vlib /sw/rhel7/siemens/questa_cdc_formal-2022.4_1/linux_x86_64/share/modeltech/linux_x86_64/../std_developerskit')"
# endif
# $vlib_exec /sw/rhel7/siemens/questa_cdc_formal-2022.4_1/linux_x86_64/share/modeltech/linux_x86_64/../synopsys
# if($status == 0) then
#   $vmap_exec -modelsimini modelsim.ini synopsys /sw/rhel7/siemens/questa_cdc_formal-2022.4_1/linux_x86_64/share/modeltech/linux_x86_64/../synopsys
# else
#   echo "** Error: Library mapping failed. (Command: 'vlib /sw/rhel7/siemens/questa_cdc_formal-2022.4_1/linux_x86_64/share/modeltech/linux_x86_64/../synopsys')"
# endif
# $vlib_exec /sw/rhel7/siemens/questa_cdc_formal-2022.4_1/linux_x86_64/share/modeltech/linux_x86_64/../modelsim_lib
# if($status == 0) then
#   $vmap_exec -modelsimini modelsim.ini modelsim_lib /sw/rhel7/siemens/questa_cdc_formal-2022.4_1/linux_x86_64/share/modeltech/linux_x86_64/../modelsim_lib
# else
#   echo "** Error: Library mapping failed. (Command: 'vlib /sw/rhel7/siemens/questa_cdc_formal-2022.4_1/linux_x86_64/share/modeltech/linux_x86_64/../modelsim_lib')"
# endif
# $vlib_exec /sw/rhel7/siemens/questa_cdc_formal-2022.4_1/linux_x86_64/share/modeltech/linux_x86_64/../symphony_netspy_lib
# if($status == 0) then
#   $vmap_exec -modelsimini modelsim.ini symphony_netspy_lib /sw/rhel7/siemens/questa_cdc_formal-2022.4_1/linux_x86_64/share/modeltech/linux_x86_64/../symphony_netspy_lib
# else
#   echo "** Error: Library mapping failed. (Command: 'vlib /sw/rhel7/siemens/questa_cdc_formal-2022.4_1/linux_x86_64/share/modeltech/linux_x86_64/../symphony_netspy_lib')"
# endif
# $vlib_exec /sw/rhel7/siemens/questa_cdc_formal-2022.4_1/linux_x86_64/share/modeltech/linux_x86_64/../sv_std
# if($status == 0) then
#   $vmap_exec -modelsimini modelsim.ini sv_std /sw/rhel7/siemens/questa_cdc_formal-2022.4_1/linux_x86_64/share/modeltech/linux_x86_64/../sv_std
# else
#   echo "** Error: Library mapping failed. (Command: 'vlib /sw/rhel7/siemens/questa_cdc_formal-2022.4_1/linux_x86_64/share/modeltech/linux_x86_64/../sv_std')"
# endif
# $vlib_exec /sw/rhel7/siemens/questa_cdc_formal-2022.4_1/linux_x86_64/share/modeltech/linux_x86_64/../avm
# if($status == 0) then
#   $vmap_exec -modelsimini modelsim.ini mtiAvm /sw/rhel7/siemens/questa_cdc_formal-2022.4_1/linux_x86_64/share/modeltech/linux_x86_64/../avm
# else
#   echo "** Error: Library mapping failed. (Command: 'vlib /sw/rhel7/siemens/questa_cdc_formal-2022.4_1/linux_x86_64/share/modeltech/linux_x86_64/../avm')"
# endif
# $vlib_exec /sw/rhel7/siemens/questa_cdc_formal-2022.4_1/linux_x86_64/share/modeltech/linux_x86_64/../rnm
# if($status == 0) then
#   $vmap_exec -modelsimini modelsim.ini mtiRnm /sw/rhel7/siemens/questa_cdc_formal-2022.4_1/linux_x86_64/share/modeltech/linux_x86_64/../rnm
# else
#   echo "** Error: Library mapping failed. (Command: 'vlib /sw/rhel7/siemens/questa_cdc_formal-2022.4_1/linux_x86_64/share/modeltech/linux_x86_64/../rnm')"
# endif
# $vlib_exec /sw/rhel7/siemens/questa_cdc_formal-2022.4_1/linux_x86_64/share/modeltech/linux_x86_64/../ovm-2.1.2
# if($status == 0) then
#   $vmap_exec -modelsimini modelsim.ini mtiOvm /sw/rhel7/siemens/questa_cdc_formal-2022.4_1/linux_x86_64/share/modeltech/linux_x86_64/../ovm-2.1.2
# else
#   echo "** Error: Library mapping failed. (Command: 'vlib /sw/rhel7/siemens/questa_cdc_formal-2022.4_1/linux_x86_64/share/modeltech/linux_x86_64/../ovm-2.1.2')"
# endif
# $vlib_exec /sw/rhel7/siemens/questa_cdc_formal-2022.4_1/linux_x86_64/share/modeltech/linux_x86_64/../uvm-1.1d
# if($status == 0) then
#   $vmap_exec -modelsimini modelsim.ini mtiUvm /sw/rhel7/siemens/questa_cdc_formal-2022.4_1/linux_x86_64/share/modeltech/linux_x86_64/../uvm-1.1d
# else
#   echo "** Error: Library mapping failed. (Command: 'vlib /sw/rhel7/siemens/questa_cdc_formal-2022.4_1/linux_x86_64/share/modeltech/linux_x86_64/../uvm-1.1d')"
# endif
# $vlib_exec /sw/rhel7/siemens/questa_cdc_formal-2022.4_1/linux_x86_64/share/modeltech/linux_x86_64/../upf_lib
# if($status == 0) then
#   $vmap_exec -modelsimini modelsim.ini mtiUPF /sw/rhel7/siemens/questa_cdc_formal-2022.4_1/linux_x86_64/share/modeltech/linux_x86_64/../upf_lib
# else
#   echo "** Error: Library mapping failed. (Command: 'vlib /sw/rhel7/siemens/questa_cdc_formal-2022.4_1/linux_x86_64/share/modeltech/linux_x86_64/../upf_lib')"
# endif
# $vlib_exec /sw/rhel7/siemens/questa_cdc_formal-2022.4_1/linux_x86_64/share/modeltech/linux_x86_64/../flcov_ce_lib
# if($status == 0) then
#   $vmap_exec -modelsimini modelsim.ini flcov_ce_lib /sw/rhel7/siemens/questa_cdc_formal-2022.4_1/linux_x86_64/share/modeltech/linux_x86_64/../flcov_ce_lib
# else
#   echo "** Error: Library mapping failed. (Command: 'vlib /sw/rhel7/siemens/questa_cdc_formal-2022.4_1/linux_x86_64/share/modeltech/linux_x86_64/../flcov_ce_lib')"
# endif
# $vlib_exec /sw/rhel7/siemens/questa_cdc_formal-2022.4_1/linux_x86_64/share/modeltech/linux_x86_64/../pa_lib
# if($status == 0) then
#   $vmap_exec -modelsimini modelsim.ini mtiPA /sw/rhel7/siemens/questa_cdc_formal-2022.4_1/linux_x86_64/share/modeltech/linux_x86_64/../pa_lib
# else
#   echo "** Error: Library mapping failed. (Command: 'vlib /sw/rhel7/siemens/questa_cdc_formal-2022.4_1/linux_x86_64/share/modeltech/linux_x86_64/../pa_lib')"
# endif
# $vlib_exec /sw/rhel7/siemens/questa_cdc_formal-2022.4_1/linux_x86_64/share/modeltech/linux_x86_64/../floatfixlib
# if($status == 0) then
#   $vmap_exec -modelsimini modelsim.ini floatfixlib /sw/rhel7/siemens/questa_cdc_formal-2022.4_1/linux_x86_64/share/modeltech/linux_x86_64/../floatfixlib
# else
#   echo "** Error: Library mapping failed. (Command: 'vlib /sw/rhel7/siemens/questa_cdc_formal-2022.4_1/linux_x86_64/share/modeltech/linux_x86_64/../floatfixlib')"
# endif
# $vlib_exec /sw/rhel7/siemens/questa_cdc_formal-2022.4_1/linux_x86_64/share/modeltech/linux_x86_64/../mc2_lib
# if($status == 0) then
#   $vmap_exec -modelsimini modelsim.ini mc2_lib /sw/rhel7/siemens/questa_cdc_formal-2022.4_1/linux_x86_64/share/modeltech/linux_x86_64/../mc2_lib
# else
#   echo "** Error: Library mapping failed. (Command: 'vlib /sw/rhel7/siemens/questa_cdc_formal-2022.4_1/linux_x86_64/share/modeltech/linux_x86_64/../mc2_lib')"
# endif
# $vlib_exec /sw/rhel7/siemens/questa_cdc_formal-2022.4_1/linux_x86_64/share/modeltech/linux_x86_64/../flps_lib
# if($status == 0) then
#   $vmap_exec -modelsimini modelsim.ini flps_lib /sw/rhel7/siemens/questa_cdc_formal-2022.4_1/linux_x86_64/share/modeltech/linux_x86_64/../flps_lib
# else
#   echo "** Error: Library mapping failed. (Command: 'vlib /sw/rhel7/siemens/questa_cdc_formal-2022.4_1/linux_x86_64/share/modeltech/linux_x86_64/../flps_lib')"
# endif
# $vlib_exec /sw/rhel7/siemens/questa_cdc_formal-2022.4_1/linux_x86_64/share/modeltech/linux_x86_64/../mgc_ams
# if($status == 0) then
#   $vmap_exec -modelsimini modelsim.ini mgc_ams /sw/rhel7/siemens/questa_cdc_formal-2022.4_1/linux_x86_64/share/modeltech/linux_x86_64/../mgc_ams
# else
#   echo "** Error: Library mapping failed. (Command: 'vlib /sw/rhel7/siemens/questa_cdc_formal-2022.4_1/linux_x86_64/share/modeltech/linux_x86_64/../mgc_ams')"
# endif
# $vlib_exec /sw/rhel7/siemens/questa_cdc_formal-2022.4_1/linux_x86_64/share/modeltech/linux_x86_64/../ieee_env
# if($status == 0) then
#   $vmap_exec -modelsimini modelsim.ini ieee_env /sw/rhel7/siemens/questa_cdc_formal-2022.4_1/linux_x86_64/share/modeltech/linux_x86_64/../ieee_env
# else
#   echo "** Error: Library mapping failed. (Command: 'vlib /sw/rhel7/siemens/questa_cdc_formal-2022.4_1/linux_x86_64/share/modeltech/linux_x86_64/../ieee_env')"
# endif
# $vlib_exec /sw/rhel7/siemens/questa_cdc_formal-2022.4_1/linux_x86_64/share/modeltech/linux_x86_64/../infact
# if($status == 0) then
#   $vmap_exec -modelsimini modelsim.ini infact /sw/rhel7/siemens/questa_cdc_formal-2022.4_1/linux_x86_64/share/modeltech/linux_x86_64/../infact
# else
#   echo "** Error: Library mapping failed. (Command: 'vlib /sw/rhel7/siemens/questa_cdc_formal-2022.4_1/linux_x86_64/share/modeltech/linux_x86_64/../infact')"
# endif
# $vlib_exec /sw/rhel7/siemens/questa_cdc_formal-2022.4_1/linux_x86_64/share/modeltech/linux_x86_64/../vh_flcov_lib
# if($status == 0) then
#   $vmap_exec -modelsimini modelsim.ini vh_flcov_lib /sw/rhel7/siemens/questa_cdc_formal-2022.4_1/linux_x86_64/share/modeltech/linux_x86_64/../vh_flcov_lib
# else
#   echo "** Error: Library mapping failed. (Command: 'vlib /sw/rhel7/siemens/questa_cdc_formal-2022.4_1/linux_x86_64/share/modeltech/linux_x86_64/../vh_flcov_lib')"
# endif
# $vlib_exec /sw/rhel7/siemens/questa_cdc_formal-2022.4_1/linux_x86_64/share/modeltech/linux_x86_64/../vhdlopt_lib
# if($status == 0) then
#   $vmap_exec -modelsimini modelsim.ini vhdlopt_lib /sw/rhel7/siemens/questa_cdc_formal-2022.4_1/linux_x86_64/share/modeltech/linux_x86_64/../vhdlopt_lib
# else
#   echo "** Error: Library mapping failed. (Command: 'vlib /sw/rhel7/siemens/questa_cdc_formal-2022.4_1/linux_x86_64/share/modeltech/linux_x86_64/../vhdlopt_lib')"
# endif
# $vlib_exec /sw/rhel7/siemens/questa_cdc_formal-2022.4_1/linux_x86_64/share/modeltech/linux_x86_64/../vh_ux01v_lib
# if($status == 0) then
#   $vmap_exec -modelsimini modelsim.ini vh_ux01v_lib /sw/rhel7/siemens/questa_cdc_formal-2022.4_1/linux_x86_64/share/modeltech/linux_x86_64/../vh_ux01v_lib
# else
#   echo "** Error: Library mapping failed. (Command: 'vlib /sw/rhel7/siemens/questa_cdc_formal-2022.4_1/linux_x86_64/share/modeltech/linux_x86_64/../vh_ux01v_lib')"
# endif
# $vlib_exec /homedir01/alehtoah24/DT2_2026/project/workdir/qautocheck_work
if($status == 0) then
  $vmap_exec -modelsimini modelsim.ini qautocheck_work /homedir01/alehtoah24/DT2_2026/project/workdir/qautocheck_work
else
  echo "** Error: Library mapping failed. (Command: 'vlib /homedir01/alehtoah24/DT2_2026/project/workdir/qautocheck_work')"
endif
# $vlib_exec /homedir01/alehtoah24/DT2_2026/project/workdir/.//output/qautocheck_run_log/autocheck.db/AN/zin_vopt_work
if($status == 0) then
  $vmap_exec -modelsimini modelsim.ini z0in_work_ctrl /homedir01/alehtoah24/DT2_2026/project/workdir/.//output/qautocheck_run_log/autocheck.db/AN/zin_vopt_work
else
  echo "** Error: Library mapping failed. (Command: 'vlib /homedir01/alehtoah24/DT2_2026/project/workdir/.//output/qautocheck_run_log/autocheck.db/AN/zin_vopt_work')"
endif
