#!/usr/bin/bash

# Commandes pour donner accès à root seulement
#a) 
sed  -ri "2,$ s/\/[(bash)|(tcsh)|(dash)|(csh)|(sh)]+$/\/false/" /etc/passwd

# b) Commande pour arreter iptables
chkconfig iptables off

# b) Commande pour arreter kdump
service stop kdump
service disable kdump

# c) Ligne à rajouter à /etc/fstab
/dev/sda3 /export ext3

# c) Ligne pour monter la partition sda3
mkdir /export
sudo mount /dev/sda3 /export

# d) Ligne pour installer tous les programmes
cd /export
rpm -ivh *.rpm

# e) Lignes pour écouter echo avec telnet
/etc/xinetd.d start
/etc/xinetd.d/echo-stream
telnet localhost echo
#get out with ctl-]

# f) 
mkdir /export/home/

# g) Message of the day
vim /etc/motd

# h) Changer nom de l'ordinateur
vim /etc/sysconfig/network
vi /etc/hosts

# i) Créer 2 nouveux usagers
vim /etc/default/useradd
groupadd ville
groupadd province

useradd -g ville -G province -s /etc/tcsh/ -p capitale quebec
useradd -g ville -s /etc/tcsh/ -p metropole montreal

#j)
echo "/export/home localhost(rw)" >> /etc/exports
echo "/home auto.home" >> /etc/auto.master
echo "montreal localhost:/export/home/montreal\nquebec localhost:/export/home/quebec\n"

#k)

