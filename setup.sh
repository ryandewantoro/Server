#!/bin/bash
echo "Memulai install";
apt-get update && apt-get upgrade
apt-get install apache2 php5 libapache2-mod-php5 php5-mcrypt php5-mysql php5-common php5-cli
php5enmod mcrypt
service apache2 restart
apt-get install php5-curl php5-gd php5-snmp snmp curl git
apt-get install mysql-server
apt-get install phpmyadmin
apt-get install samba
echo "Install Selesai.......";
sh setting.sh
