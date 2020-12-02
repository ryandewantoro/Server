#!/bin/bash
# must root
if [[ $EUID -ne 0 ]]; then
   echo "This script must be run as root" 
   exit 1
fi
echo "Memulai install";

# 1 install lamp
apt-get update && apt-get upgrade
apt-get install apache2 php5 libapache2-mod-php5 php5-mcrypt php5-mysql php5-common php5-cli curl php-zip
php5enmod mcrypt
service apache2 restart
apt-get install php5-curl php5-gd php5-snmp snmp curl git php5-pgsql
apt-get install mysql-server mysql-client
apt-get install phpmyadmin
a2enmod ssl

# 2 tunning apache2
#apache2.conf
sed -e 's/MaxKeepAliveRequests 100*/MaxKeepAliveRequests 0/g' /etc/apache2/apache2.conf
#mematikan http header
sed -e 's/expose_php = On*/expose_php = Off/g' /etc/apache2/apache2.conf
echo "<IfModule prefork.c>
StartServers       8
MinSpareServers    5
MaxSpareServers    100
ServerLimit        512
MaxClients         512
MaxRequestsPerChild  4000
</IfModule>" >> /etc/apache2/apache2.conf

# 3 tunning mysql
#mysql
max_connections = 1000

# 4 tunning php
#php.ini
memory_limit = 10G
upload_max_filesize = 12M
post_max_size = 13M
file_uploads = On
max_execution_time = 180

#create virtual host

sitename = "ryandewantoro.com"

echo "
<VirtualHost *:80>
        ServerAdmin admin@$sitename
        ServerName $sitename
        ServerAlias $sitename
        DocumentRoot /var/www/html/$sitename/
        Redirect "/" "https://$sitename"
</VirtualHost>
<VirtualHost *:443>
        SSLEngine On
        SSLCertificateFile /etc/apache2/ssl/$sitename.crt
        SSLCertificateKeyFile /etc/apache2/ssl/$sitename.key
        SSLCACertificateFile /etc/apache2/ssl/$sitename.cer

        ServerAdmin admin@$sitename
        ServerName $sitename
        ServerAlias $sitename
        DocumentRoot /var/www/html/$sitename/
        <Directory />
                Options None
                AllowOverride None
                Order Deny,Allow
                Deny from all
        </Directory>
        <Directory /var/www/html/$sitename/>
                Options None +FollowSymLinks
                AllowOverride All
                Order allow,deny
                allow from all
                Require all granted
        </Directory>

        ErrorLog ${APACHE_LOG_DIR}/error.log

        # Possible values include: debug, info, notice, warn, error, crit,
        # alert, emerg.
        LogLevel warn

        CustomLog ${APACHE_LOG_DIR}/access.log combined
</VirtualHost>
" >> /etc/apache2/sites-available/$sitename.conf


# 5 cronjob
echo "* 1 * * * chmod -R 777 /var/www/html/" > /etc/cron.d/jadwal >> /var/log/cron.log
echo "* 1 * * * chmod -R 777 /var/www/html/" > /etc/cron.hourly/jadwal >> /var/log/cron.log
echo "* 1 * * * chmod -R 777 /var/www/html/" > /var/spool/cron/crontabs/root

# cara lihat hasil log cronjob
grep CRON /var/log/syslog

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

# 6 install portainer
apt-get remove docker docker-engine docker.io
apt install docker.io
systemctl start docker
systemctl enable docker
docker pull mysql:8.0.1
docker pull portainer/portainer
docker pull phpmyadmin/phpmyadmin:latest
docker run --name my-own-mysql -e MYSQL_ROOT_PASSWORD=mypass123 -d mysql:8.0.1
docker run --name my-own-phpmyadmin -d --link my-own-mysql:db -p 8081:80 phpmyadmin/phpmyadmin
docker run -d -p 9000:9000 -v /var/run/docker.sock:/var/run/docker.sock portainer/portainer
echo "Install Selesai.......";
