#!/bin/bash
#Créer un Vagrantfile: vagrant init
#Puis nano du Vagrantfile et modifier les lignes suivantes:
#- config.vm.box = "xenial.box"
#- #config.vm.network "private_network", ip: "192.168.33.10" qui est à décommenter
#- #config.vm.synced_folder "../data", "/vagrant_data" à faire devenir -> config.vm.synced_folder "data", "/var/www/html" et à décommenter
#Démarrer sa Vagrant: vagrant up
#Se connecter en SSH sur sa Vagrant: vagrant ssh

echo "Interface de gestion de box";
read -p "Choix de la box (1)Xenial.local (2)Xenial.distant (3)Autre :" CHOIX;
case $CHOIX in
  1) box="xenial.box" ;;
  2) box="xenial.box" ;;
  *) echo "Autre" ;;
esac
read -p "Votre dossier (chemin relatif) : " chemin;
read -p "Votre dossier sur le serveur (chemin absolu) : " cheminServ;


echo "# -*- mode: ruby -*-
Vagrant.configure('2') do |config|
config.vm.box = '$box'
config.vm.network 'private_network', ip: '192.168.33.10'
config.vm.synced_folder '$chemin', '/$cheminServ'
config.vm.provider 'virtualbox' do |vb|
vb.memory = '1024'
end
end" >> Vagrantfile
vagrant up

read -p "Appuyez sur ENTREE pour afficher la/les machine(s) virtuelle(s) existante(s) :" liste;
vagrant status
read -p "Lancer la connexion SSH ? Y/N" connection;
vagrant ssh
