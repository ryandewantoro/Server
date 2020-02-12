#!/bin/sh
apt update
apt install apache2 libapache2-mod-fcgid
apt install software-properties-common | add-apt-repository ppa:ondrej/php | apt update
apt install php7.3 php7.3-fpm
apt install php-mysql
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
a2ensite /etc/apache2/sites-available/airprigen.com.conf
/etc/init.d/apache2 start | /etc/init.d/apache2 restart | /etc/init.d/apache2 status
/etc/init.d/php7.3-fpm start | /etc/init.d/php7.3-fpm restart | /etc/init.d/php7.3-fpm status
echo "<?php phpinfo(); ?>" > /var/www/html/info.php
apt install mysql-server | /etc/init.d/mysql start | /etc/init.d/mysql restart
mysql_secure_installation
mysql
SELECT user,authentication_string,plugin,host FROM mysql.user;
ALTER USER 'root'@'localhost' IDENTIFIED WITH mysql_native_password BY '4rt1s4n';
FLUSH PRIVILEGES;
SELECT user,authentication_string,plugin,host FROM mysql.user;
exit | mysql | mysql -u root -p | CREATE USER 'root'@'localhost' IDENTIFIED BY '4rt1s4n'; | GRANT ALL PRIVILEGES ON *.* TO 'root'@'localhost' WITH GRANT OPTION;
exit | /etc/init.d/mysql restart
