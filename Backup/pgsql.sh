#!/bin/bash
DATE=`date +%Y%m%d`
dataexp=`date --d 7yesterday +%Y%m%d`
LOGFILE=Log`date +%Y%m%d`.log
user='pusdakom'
touch $LOGFILE
export PGPASSWORD=123456789

pg_dump -h 192.168.10.9 -p 5432 -U root -F c -b -v skripsiku > /home/$user/db-$DATE.backup

echo `date +%Y/%m/%d` `date +%H:%m` "/home/$user/db-$DATE.backup" > $LOGFILE

gzip -f /home/$user/db-$DATE.backup

echo 'hapus file seminggu yg lalu.'
echo 'cek dulu jika sdh lebih dari 7 file.'

if [ $(ls /home/$user | wc -l) -gt 7 ]
then
echo 'ada lebih dari 7 file'
cd /home/$user/
rm *$dataexp.backup.gz
fi
echo 'hapus seminggu yg lalu selesa'
