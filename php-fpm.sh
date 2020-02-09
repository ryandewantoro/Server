#!/bin/sh
apt update
apt install apache2 libapache2-mod-fcgid
apt install software-properties-common | add-apt-repository ppa:ondrej/php
apt update
apt install php7.3 php7.3-fpm
a2enmod actions fcgid alias proxy_fcgi
mkdir /var/www/html/airprigen | /var/www/html/airprigen/public_html | /var/www/html/airprigen/logs
chmod -R 777 /var/www/html
echo "<VirtualHost *:80>
    ServerName airprigen.com
    ServerAlias www.airprigen.com
    DocumentRoot /var/www/html/airprigen/public_html/
 
    <Directory /var/www/html/airprigen/public_html/>
        Options -Indexes +FollowSymLinks +MultiViews
        AllowOverride All
        Require all granted
    </Directory>
 
    <FilesMatch \.php$>
        # 2.4.10+ can proxy to unix socket
        SetHandler "proxy:unix:/var/run/php/php7.3-fpm.sock|fcgi://localhost"
    </FilesMatch>
 
    ErrorLog /var/www/html/airprigen/public_html/logs/error.log
    CustomLog /var/www/html/airprigen/public_html/logs/access.log combined
</VirtualHost>" > /etc/apache2/sites-available/airprigen.com.conf
/etc/init.d/apache2 start | /etc/init.d/apache2 restart | /etc/init.d/apache2 status
/etc/init.d/php7.3-fpm start | /etc/init.d/php7.3-fpm restart | /etc/init.d/php7.3-fpm status
echo "<?php phpinfo(); ?>" > /var/www/html/info.php
