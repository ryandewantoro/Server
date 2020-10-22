service unifi stop
mongod --dbpath /usr/lib/unifi/data/db --smallfiles --logpath /usr/lib/unifi/logs/server.log --repair
chown -R unifi:unifi /usr/lib/unifi/data/db/
chown -R unifi:unifi /usr/lib/unifi/logs/server.log
service unifi start
