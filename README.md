# kubernetes
# le script install-kub-docker.sh permet d'installer docker v19.03.8, kubernetes v1.18.3 et kubectl v1.23.0 avec activation de minikube comme service via bash.
Après avoir cloner le répertoire
# $ sudo mv kubernetes/install_kub_dock.sh install_kub_dock.sh
# $ vi install_kub_dock.sh
Modifiez la ligne 49 (user) et ligne 50 (group) avec l'utilisateur qui a full privilège.

# Exécution script
Lancez les commandes ci-dessous:
# $ sudo chmod +x install_kub_dock.sh
# $ sudo sh install_kub_dock.sh
# $ sudo vi /etc/kubernetes/admin.conf
Changez la ligne 5 par le nom de votre hostname puis enrégistrez et redémarrez le serveur. server: https://nom_hostname.minikube.internal:8443
