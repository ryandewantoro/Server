auto eth0  
iface eth0 inet static  
address 192.168.0.100  
gateway 192.168.0.1  
netmask 255.255.255.0  
network 192.168.0.0  
broadcast 192.168.0.255
dns-nameservers 8.8.8.8

ifconfig eth0 192.168.0.1 netmask 255.255.255.0 
route add default gw 192.168.0.253 eth0
