#!/bin/bash
echo "Memulai install . . . . . . . . . .";
apt-get update
apt-get install speech-dispatcher
spd-say -t female1 "Hello friend"
apt-get install mysql-client
apt-get install postgresql-client
apt-get install git
echo "Selesai . . . . . . . . . .";
spd-say -t female1 "Install Selesai"
