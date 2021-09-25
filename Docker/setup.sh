# install portainer
apt-get remove docker docker-engine docker.io
apt install docker.io
systemctl start docker
systemctl enable docker
docker pull mysql:8.0.1
docker pull portainer/portainer
docker pull pihole/pihole
docker pull phpmyadmin/phpmyadmin:latest
docker run --name my-own-mysql -e MYSQL_ROOT_PASSWORD=mypass123 -d mysql:8.0.1
docker run --name my-own-phpmyadmin -d --link my-own-mysql:db -p 8081:80 phpmyadmin/phpmyadmin
docker run -d --restart=always -p 9000:9000 -v /var/run/docker.sock:/var/run/docker.sock portainer/portainer

docker volume create pihole
docker volume create dnsmasq
docker run --name=pihole -e TZ=Asia/Jakarta -e WEBPASSWORD=dJknse -e SERVERIP=192.168.62.206 -v pihole:/etc/pihole -v dnsmasq:/etc/dnsmasq.d -p 1000:80 -p 53:53/tcp -p 53:53/udp --restart=always pihole/pihole
echo "Install Selesai.......";
