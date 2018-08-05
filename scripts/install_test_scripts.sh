#!/usr/bin/env bash
set -x

IFACE=`route -n | awk '$1 == "192.168.2.0" {print $8}'`
CIDR=`ip addr show ${IFACE} | awk '$2 ~ "192.168.2" {print $2}'`
IP=${CIDR%%/24}

# Generate Test Secret
TESTSECRET=`openssl rand -base64 32`

cat /usr/local/bootstrap/.vault-token | sudo VAULT_ADDR="http://${IP}:8200" vault login - 


sudo VAULT_ADDR="http://${IP}:8200" vault kv put secret/COMPANYDATABASE/PASSWORD value=${TESTSECRET}
sudo VAULT_ADDR="http://${IP}:8200" vault kv get secret/COMPANYDATABASE/PASSWORD

# Try reading back secret using envconsul
export VAULT_TOKEN=`cat /usr/local/bootstrap/.vault-token`
sudo VAULT_TOKEN=`cat /usr/local/bootstrap/.vault-token` VAULT_ADDR="http://${IP}:8200" envconsul -once -secret secret/COMPANYDATABASE/PASSWORD env
