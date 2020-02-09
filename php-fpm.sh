#!/bin/sh
apt update
apt install apache2 libapache2-mod-fcgid
apt install software-properties-common | add-apt-repository ppa:ondrej/php
apt update
apt install php7.3 php7.3-fpm
a2enmod actions fcgid alias proxy_fcgi

echo "<?php phpinfo(); ?>" > /var/www/html/info.php
