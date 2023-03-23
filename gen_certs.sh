#!/usr/bin/env bash

#########################################################
# This script sets up a local certificate authority     #
# and generates a server certificate to quick start     #
# setting up SSL for local development.                 #
#########################################################

# Certificate Subject
COUNTRY='AU'
STATE_PROV='Some-State'
LOCAL_CITY='Some-City'
ORG_NAME='ACME Self Signed'
ORG_UNIT='R&D'
COMMON_NAME='ACME Self Signed'
EMAIL='acme@selfsignedcerts.co'

SERV_NAME='localhost'

read -sp 'Enter the passphrase for the private keys: ' key_pass

create_files_dirs () {
    mkdir root-ca
    
    dirs -c

    pushd root-ca >/dev/null
    mkdir intermediate certs private keystore
    echo 01 > serial
    touch index.txt

    pushd intermediate > /dev/null
    echo 01 > crlnumber
    echo 01 > serial
    touch index.txt
    mkdir certs private
    popd >/dev/null

    popd >/dev/null
}
