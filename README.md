# kubernetes
# le script install-kub-docker.sh permet d'installer docker v19.03.8, kubernetes v1.18.3 et kubectl v1.23.0 avec activation de minikube comme service via bash.
# Exécution script
# Après avoir cloner le répertoire, lancez les commandes ci-dessous:
# $ cd kubernetes
# $ sudo chmod +x install_kube_dock.sh
# $ sudo ./install_kube_dock.sh
# $ sudo vi /etc/kubernetes/admin.conf
Changez la ligne 5 par le nom de votre hostname puis enrégistrez et redémarrez le serveur.
server: https://nom_hostname.minikube.internal:8443
