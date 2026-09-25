#!/bin/csh 

source ../setup_env.csh

setenv WORKDIR workdir

rm -rf output/* $WORKDIR/* $WORKDIR/.??*

foreach dir (output reports results)
    if (! -e $dir) then
	mkdir $dir
    endif
end

if (! -e $WORKDIR) then
  mkdir $WORKDIR
endif

if (! -l $WORKDIR/input) then
    ln -s ../input $WORKDIR/input
endif

if (! -l $WORKDIR/output) then
    ln -s ../output $WORKDIR/output
endif

if (! -l $WORKDIR/reports) then
    ln -s ../reports $WORKDIR/reports
endif

if (! -l $WORKDIR/results) then
    ln -s ../results $WORKDIR/results
endif

if (! -l $WORKDIR/scripts) then
    ln -s ../scripts $WORKDIR/scripts
endif


# Check for updates
if ( -f $DT2_HOME/updates.txt) then
    set filelist=`cat $DT2_HOME/updates.txt`
    foreach f ($filelist)
      cp -ruv $DT2_HOME/$f ~/DT2_2026/$f
    end
endif




