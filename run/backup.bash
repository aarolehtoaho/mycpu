
if [ ! -d .backup ]; then
    mkdir .backup
fi

if [ ! -f .backup/date ]; then
    date > .backup/date
fi

if [[ $(find ".backup/date" -mtime +1 ) ]]; then
    echo "File $filename exists and is older than 7 days"
    date > .backup/date
    buname=backup.`date +%H%M%d%m%y`.tar.gz
    tar czf .backup/$buname input
fi
