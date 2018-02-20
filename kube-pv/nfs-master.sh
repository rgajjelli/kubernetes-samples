# SSH into the Kubernetes master and run the following commands
sudo -i
mkdir -p /opt/data
chmod 777 /opt/data
echo "/opt/data 192.168.146.0/24(rw,sync,no_root_squash,no_all_squash)"  >> /etc/exports
systemctl enable --now rpcbind
systemctl enable --now nfs-server
systemctl restart rpcbind
systemctl restart nfs-server
#mongodb
mkdir -p /opt/data/vol/0
mkdir -p /opt/data/vol/1
mkdir -p /opt/data/vol/2
mkdir -p /opt/data/content

#mysql data
mkdir -p /opt/data/vol//mysql/0
mkdir -p /opt/data/vol/mysql/1
mkdir -p /opt/data/vol/mysql/2

#nginx
mkdir -p /opt/data/vol/nginx

#Check the exports
exportfs -ra
