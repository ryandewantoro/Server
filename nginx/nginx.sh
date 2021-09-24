#!/bin/bash
apt-get update
apt-get install nginx php5 php5-fpm php5-cli php5-common php-gd php-apc




service nginx restart
service php5-fpm restart
