echo $DESIGN_NAME " " `date '+%Y %m %d %H %M'` " " $0 >> ../.runlog

if ($?DT2_CLEANUP_ENV) then
    /bin/rm -rf  output/* workdir/* workdir/.??*
endif
