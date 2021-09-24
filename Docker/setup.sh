# install portainer
apt-get remove docker docker-engine docker.io
apt install docker.io
systemctl start docker
systemctl enable docker
docker pull mysql:8.0.1
docker pull portainer/portainer
docker pull phpmyadmin/phpmyadmin:latest
docker run --name my-own-mysql -e MYSQL_ROOT_PASSWORD=mypass123 -d mysql:8.0.1
docker run --name my-own-phpmyadmin -d --link my-own-mysql:db -p 8081:80 phpmyadmin/phpmyadmin
docker run -d --restart=always -p 9000:9000 -v /var/run/docker.sock:/var/run/docker.sock portainer/portainer
echo "Install Selesai.......";
