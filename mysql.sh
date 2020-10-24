#konfigurasi


#komunikasi
apt install sshpass
sshpass -p 'cobasaja' ssh root@10.10.1.10

#install dan konfigurasi database
echo "program di mulai";
apt-get install mysql-server mysql-client
echo "menulis script di my.cnf";
echo "server-id              = 1
log_bin                = /var/log/mysql/mysql-bin.log
binlog_do_db           = db_umsida
#bind-address          = 127.0.0.1" >> /etc/mysql/my.cnf
echo "restart mysql";
/etc/init.d/mysql restart

mysql -u root -proot

create user 'replicator'@'%' identified by 'root';
grant replication slave on *.* to 'replicator'@'%';
show master status;


echo "pindah ke server B";

apt-get install mysql-server mysql-client

server-id              = 2
log_bin                = /var/log/mysql/mysql-bin.log
binlog_do_db           = db_umsida
# bind-address         = 127.0.0.1

/etc/init.d/mysql restart

mysql -u root -proot
create user 'replicator'@'%' identified by 'root';
create database db_umsida;

grant replication slave on *.* to 'replicator'@'%';

slave stop; 
CHANGE MASTER TO MASTER_HOST = '192.168.10.22', MASTER_USER = 'replicator', MASTER_PASSWORD = 'root', MASTER_LOG_FILE = 'mysql-bin.000001', MASTER_LOG_POS = 107; 
slave start;

show master status;

echo "pindah ke server A";

slave stop; 
CHANGE MASTER TO MASTER_HOST = '192.168.10.23', MASTER_USER = 'replicator', MASTER_PASSWORD = 'root', MASTER_LOG_FILE = 'mysql-bin.000002', MASTER_LOG_POS = 109; 
slave start;

create database contohdb;
create table contohdb.dummy (`id` varchar(10));
show tables in contohdb;

# link https://linux.tutorials.id/cara-setting-dan-syncronize-mysql-master-master/

#http://www.clusterdb.com/mysql-cluster/get-mysql-replication-up-and-running-in-5-minutes
