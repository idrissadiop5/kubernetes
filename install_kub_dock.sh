#!/bin/bash
sudo mkdir /package
cd /package
sudo yum update -y 
sudo yum -y install epel-release
sudo yum -y install git libvirt qemu-kvm virt-install virt-top libguestfs-tools bridge-utils
# Socat gérer les requêtes entre l'hôte et le conteneur
sudo yum install socat -y
# Conntract gérer l'utilisation du CPU de votre machine
sudo yum install -y conntrack
sudo curl -fsSL https://get.docker.com -o get-docker.sh
sudo sh get-docker.sh
sudo usermod -aG docker vagrant
sudo systemctl start docker
sudo systemctl enable docker
sudo yum -y install wget
sudo wget https://storage.googleapis.com/minikube/releases/v1.11.0/minikube-linux-amd64
sudo chmod +x minikube-linux-amd64
# déplacer le minikube pour qu'on puisse l'utiliser comme commande 
sudo mv minikube-linux-amd64 /usr/bin/minikube
# Installation kubernetes-client (kubectl)
sudo yum install kubernetes-client -y
#ou bien télécharger le kubectl et déplacer pour qu'on puisse l'utiliser comme commande
sudo curl -LO https://storage.googleapis.com/kubernetes-release/release/v1.23.0/bin/linux/amd64/kubectl
sudo chmod +x kubectl
sudo mv kubectl /usr/bin/
sudo echo ‘1’ > /proc/sys/net/bridge/bridge-nf-call-iptables
sudo systemctl enable docker.service
# Pour définir le --driver avec minikube start, entrez le nom de l'hyperviseur que vous avez installé en minuscules où mettre none si vous êtes dans le cloud
sudo minikube start --driver=none
#Installation de git
sudo yum install git -y
