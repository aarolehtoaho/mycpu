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

/sw/rhel7/siemens/questa_cdc_formal-2022.4_1/${ZI_PLATFORM}/bin/qverifypm --monitor --host kataja6.oulu.fi --port 39633 --wd /homedir01/alehtoah24/DT2_2026/project/workdir --timestamp 1790237388 --binary /sw/rhel7/siemens/questa_cdc_formal-2022.4_1/${ZI_PLATFORM}/bin/qverifyfk --id 4 -od output/qautocheck_run_log -tool autocheck -timeout 5m -hd output/qautocheck_run_log/.qverify -import_db output/qautocheck_run_log/autocheck.db/autocheck_compile.db -mpiport kataja6.oulu.fi:34467 -slave_id 4 
