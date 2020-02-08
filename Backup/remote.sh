#!/bin/bash
chmod -R 777 BackupMysql
backup_path="/home/pusdakom/"
date=$(date +"%d-%b-%Y")
mysqldump -P 3306 -h 192.168.10.6 -u root -p -A > $backup_path/$date.sql
chmod -R 777 BackupMysql
find $backup_path/* -mtime +30 -exec rm {} \;
echo "Backup Selesai";
