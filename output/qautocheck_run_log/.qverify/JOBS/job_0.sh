#! /bin/bash 
ZI_PLATFORM="" 

if [[ `uname` -eq "Linux" ]] ; then 
  case `uname -m` in 
    x86_64) 
      ZI_PLATFORM="linux_x86_64" 
    ;; 
    aarch64) 
      ZI_PLATFORM="linux_aarch64" 
    ;; 
  esac 
fi 


export QHOME="/sw/rhel7/siemens/questa_cdc_formal-2022.4_1/${ZI_PLATFORM}"
export HOME_0IN="/sw/rhel7/siemens/questa_cdc_formal-2022.4_1/${ZI_PLATFORM}"

/sw/rhel7/siemens/questa_cdc_formal-2022.4_1/${ZI_PLATFORM}/bin/qverifypm --monitor --host kataja6.oulu.fi --port 39633 --wd /homedir01/alehtoah24/DT2_2026/project/workdir --binary /sw/rhel7/siemens/questa_cdc_formal-2022.4_1/${ZI_PLATFORM}/bin/qverifyfk --id 0 -gui -tool autocheck -import_db output/qautocheck_run_log/autocheck.db/autocheck_compile.db -od output/qautocheck_run_log -hd output/qautocheck_run_log/.qverify -client_host kataja6.oulu.fi -client_port 40759 -netcache /homedir01/alehtoah24/DT2_2026/project/workdir/output/qautocheck_run_log/autocheck.db/AUTOCHECK/NET -pm_host kataja6.oulu.fi -pm_port 39633   
