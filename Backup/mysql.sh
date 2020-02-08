
#!/bin/bash
# Database credentials
 user="root"
 password="####"
 host="192.168.10.45"
# Other options
 backup_path="/home/pusdakom/jimat/backupsql/"
 date=$(date +"%d-%b-%Y")
# Set default file permissions
 umask 777
# Dump database into SQL file
mysqldump --events --ignore-table=mysql.event --user=$user --password=$password --host=$host -A > $backup_path/$date
# Delete files older than 30 days
 find $backup_path/* -mtime +30 -exec rm {} \;
