#!/bin/bash
echo "Memulai backup";
#sshpass -p '####' rsync -e ssh -av -P -z perpustakaan@192.168.10.2:/var/www/html/ /home/pusdakom/data/perpustakaan/
echo "Perpustakaan berhasil di backup";
#sshpass -p '####' rsync -e ssh -av -P -z pusdakom@192.168.10.3:/var/www/ /home/pusdakom/data/ais/
echo "AIS berhasil di backup";
#sshpass -p '####' rsync -e ssh -av -P -z pusdakom@192.168.10.4:/var/www/ /home/pusdakom/data/journal/
echo "Journal berhasil di backup";
#sshpass -p '####w' rsync -e ssh -av -P -z pusdakom@192.168.10.5:/var/www/ /home/pusdakom/data/elearning/
echo "Elearning berhasil di backup";
##sshpass -p '####' rsync -e ssh -av -P -z pusdakom@192.168.10.6:/var/www/ /home/pusdakom/data/db/
echo "DB berhasil di backup";
sshpass -p '####' rsync -e ssh -av -P -z pusdakom@192.168.10.45:/var/www/ /home/pusdakom/data/web_http/
echo "Web_lama berhasil di backup";
#sshpass -p '####' rsync -e ssh -av -P -z pusdakom@192.168.10.46:/var/www/ /home/pusdakom/data/mycampus/
echo "Mycampus berhasil di backup";
#sshpass -p '####' rsync -e ssh -av -P -z pusdakom@192.168.10.47:/var/www/ /home/pusdakom/data/web_https/
echo "Web_https berhasil di backup";
#sshpass -p '####' rsync -e ssh -av -P -z root@192.168.10.88:/home/backup_db/ /home/pusdakom/data/db_pg/
echo "DB_pg berhasil di backup";
