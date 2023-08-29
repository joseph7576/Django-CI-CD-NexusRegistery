#!/bin/bash

# variables
DOMAIN=joeho.com
SSH_PORT=1246
BAC_DIR=/opt/backup/file_$NOW

# make backup dir if not exists
if [-z $BAC_DIR]; then
    echo "BAC_DIR exists"  
else
    mkdir -p $BAC_DIR
fi

# update/upgrade
apt update && apt upgrade -y

# most use softwares
apt install curl vim fail2ban

# disable and mask ufw
systemctl stop ufw
systemctl disable ufw
systemctl mask ufw

# fail2ban config
cp /etc/fail2ban/fail2ban.conf /etc/fail2ban/fail2ban.local
sed -i 's/ssh port/ ssh port=''$SSH_PORT/g' /etc/fail2ban/fail2ban.local
systemctl restart fail2ban
systemctl enable fail2ban
fail2ban-client status
