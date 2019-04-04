echo "program di mulai";

apt-get install mysql-server mysql-client

nano /etc/mysql/my.cnf

#ini di tulis
server-id              = 1
log_bin                = /var/log/mysql/mysql-bin.log
binlog_do_db           = db_umsida
#bind-address          = 127.0.0.1

/etc/init.d/mysql restart

mysql -u root -proot

create user 'replicator'@'%' identified by 'root';
grant replication slave on *.* to 'replicator'@'%';
show master status;


echo "pindah ke server satunya";

apt-get install mysql-server mysql-client

server-id              = 2
log_bin                = /var/log/mysql/mysql-bin.log
binlog_do_db           = db_umsida
# bind-address         = 127.0.0.1

/etc/init.d/mysql restart

mysql -u root -proot
create user 'replicator'@'%' identified by 'password';
create database db_umsida;

grant replication slave on *.* to 'replicator'@'%';

slave stop; 
CHANGE MASTER TO MASTER_HOST = '111.111.111.111', MASTER_USER = 'replicator', MASTER_PASSWORD = 'password', MASTER_LOG_FILE = 'mysql-bin.000001', MASTER_LOG_POS = 107; 
slave start;

show master status;

slave stop; 
CHANGE MASTER TO MASTER_HOST = '222.222.222.222', MASTER_USER = 'replicator', MASTER_PASSWORD = 'password', MASTER_LOG_FILE = 'mysql-bin.000005', MASTER_LOG_POS = 109; 
slave start;

create database contohdb;
create table contohdb.dummy (`id` varchar(10));
show tables in contohdb;

