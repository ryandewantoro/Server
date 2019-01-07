sudo add-apt-repository ppa:ondrej/php
sudo apt-get update
sudo apt-get install php5.6 php5.6-mbstring php5.6-mcrypt php5.6-mysql php5.6-xml
sudo a2dismod php5
sudo a2enmod php5.6
sudo service apache2 restart

sudo apt-get install software-properties-common
sudo add-apt-repository ppa:ondrej/php5-5.6
sudo apt-get update
sudo apt-get upgrade
sudo apt-get install php5
