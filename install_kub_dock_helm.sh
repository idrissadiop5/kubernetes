#!/bin/bash
sudo yum update -y 
sudo yum -y install epel-release
sudo yum -y install git libvirt qemu-kvm virt-install virt-top libguestfs-tools bridge-utils
sudo systemctl start libvirtd
sudo systemctl enable libvirtd
sudo systemctl status libvirtd
sudo usermod -a -G libvirt $(whoami)
echo 'unix_sock_group = "libvirt"' > /etc/libvirt/libvirtd.conf
echo 'unix_sock_rw_perms = "0770"' > /etc/libvirt/libvirtd.conf
# Socat gérer les requêtes entre l'hôte et le conteneur
sudo yum install socat -y
# Conntract gérer l'utilisation du CPU de votre machine
sudo yum install -y conntrack
#sudo curl -fsSL https://get.docker.com -o get-docker.sh
#sudo sh get-docker.sh
#sudo usermod -aG docker vagrant
#sudo systemctl start docker
#sudo systemctl enable docker
sudo yum remove -y docker docker-common docker-selinux docker-engine-selinux docker-engine docker-ce
sudo yum install -y yum-utils device-mapper-persistent-data lvm2
sudo yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo
sudo yum list docker-ce --showduplicates | sort -r    
sudo yum install docker-ce-19.03.8-3.el7 -y
# Changer le nom d'utilisateur vagrant
sudo usermod -aG docker vagrant
sudo systemctl start docker
sudo systemctl enable docker
sudo chmod 666 /var/run/docker.sock
# Voir la version du server docker
docker version --format '{{.Server.Version}}'
sudo yum -y install wget
sudo wget https://storage.googleapis.com/minikube/releases/v1.11.0/minikube-linux-amd64
sudo chmod +x minikube-linux-amd64
# déplacer le minikube pour qu'on puisse l'utiliser comme commande 
sudo mv minikube-linux-amd64 /usr/bin/minikube
sudo curl -LO https://storage.googleapis.com/kubernetes-release/release/v1.23.0/bin/linux/amd64/kubectl
sudo chmod +x kubectl
sudo mv kubectl /usr/bin/
echo '1' > /proc/sys/net/bridge/bridge-nf-call-iptables
# Pour définir le --driver avec minikube start, entrez le nom de l'hyperviseur que vous avez installé en minuscules où mettre none si vous êtes dans le cloud
sudo minikube start --driver=none
# Activation de minikube en tant que service
echo \
'[Unit]
Description=Kickoff Minikube Cluster
After=docker.service

[Service]
Type=oneshot
ExecStart=/usr/bin/minikube start
StandardOutput=journal
User=vagrant
Group=vagrant

[Install]
WantedBy=multi-user.target' > /etc/systemd/system/minikube.service
sudo systemctl daemon-reload
sudo systemctl enable minikube
sudo systemctl start minikube
docker update --restart always $(docker ps -q)
# Install Helm v3
sudo curl -o helm-v3.10.3-linux-amd64.tar.gz https://get.helm.sh/helm-v3.10.3-linux-amd64.tar.gz
sudo chmod 777 helm-v3.10.3-linux-amd64.tar.gz
sudo tar -zxvf helm-v3.10.3-linux-amd64.tar.gz
sudo mv linux-amd64/helm /usr/local/bin/helm


