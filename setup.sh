#!/bin/bash
echo "Memulai install";
apt-get update && apt-get upgrade
apt-get install apache2 php5 libapache2-mod-php5 php5-mcrypt php5-mysql php5-common php5-cli curl
php5enmod mcrypt
service apache2 restart
apt-get install php5-curl php5-gd php5-snmp snmp curl git php5-pgsql
apt-get install mysql-server mysql-client
apt-get install phpmyadmin
a2enmod ssl
#apt-get install samba
#apt-get install postgresql postgresql-contrib
#mkdir /usr/share/adminer
#wget "http://www.adminer.org/latest.php" -O /usr/share/adminer/latest.php
#ln -s /usr/share/adminer/latest.php /usr/share/adminer/adminer.php
#echo "Alias /adminer.php /usr/share/adminer/adminer.php" | sudo tee /etc/apache2/conf-available/adminer.conf
#a2enconf adminer.conf
#systemctl reload apache2
#echo "Visit adminer http://<Server_IP_or_Domain>/adminer.php";
echo "Install Selesai.......";
#sh setting.sh

apt-get remove docker docker-engine docker.io
apt install docker.io
systemctl start docker
systemctl enable docker
docker pull mysql:8.0.1
docker run --name my-own-mysql -e MYSQL_ROOT_PASSWORD=mypass123 -d mysql:8.0.1
docker pull phpmyadmin/phpmyadmin:latest
docker run --name my-own-phpmyadmin -d --link my-own-mysql:db -p 8081:80 phpmyadmin/phpmyadmin
echo "Install Selesai.......";
