#!/usr/bin/env bash
set -x

IFACE=`route -n | awk '$1 == "192.168.2.0" {print $8}'`
CIDR=`ip addr show ${IFACE} | awk '$2 ~ "192.168.2" {print $2}'`
IP=${CIDR%%/24}

# Generate Test Secret
TESTSECRET=`openssl rand -base64 32`

cat /usr/local/bootstrap/.vault-token | sudo VAULT_ADDR="http://${IP}:8200" vault login - 


# sudo VAULT_ADDR="http://${IP}:8200" vault write secret/COMPANYDATABASE PASSWORD=${TESTSECRET}
# sudo VAULT_ADDR="http://${IP}:8200" vault read secret/COMPANYDATABASE/PASSWORD

export VAULT_ADDR="http://${IP}:8200"
export VAULT_TOKEN=`cat /usr/local/bootstrap/.vault-token`
curl \
    --location \
    --header "X-Vault-Token: ${VAULT_TOKEN}" \
    --request POST \
    --data "{ \"PASSWORD\" : \"${TESTSECRET}\" } }" \
    ${VAULT_ADDR}/v1/secret/COMPANYDATABASE

# Try reading back secret using envconsul

sudo VAULT_TOKEN=`cat /usr/local/bootstrap/.vault-token` VAULT_ADDR="http://${IP}:8200" envconsul -once -secret secret/COMPANYDATABASE env
