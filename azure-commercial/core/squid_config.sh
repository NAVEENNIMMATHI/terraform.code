#!/usr/bin/env bash

CLIENT_ID=__client_id__
CLIENT_SECRET=__client_secret__
TENANT_ID=__tenant_id__
ACCOUNT_NAME=__TerraformStateStorageAccount__
SUBSCRIPTION=__Subscription__
SQD_CERT_NAME=squidpxyself.pem

install_dependencies() {
    yum -y install squid
    sleep 5
    rpm --import https://packages.microsoft.com/keys/microsoft.asc
    sh -c 'echo -e "[azure-cli]
name=Azure CLI
baseurl=https://packages.microsoft.com/yumrepos/azure-cli
enabled=1
gpgcheck=1
gpgkey=https://packages.microsoft.com/keys/microsoft.asc" > /etc/yum.repos.d/azure-cli.repo'
    yum -y install azure-cli
}

set_permissions() {
    mkdir -p /etc/squid/ssl_cert && chmod 600 /etc/squid/ssl_cert 
    /usr/lib64/squid/ssl_crtd -c -s /var/spool/squid/ssl_db -M 4MB
    chown -R squid:squid /var/spool/squid/ssl_db
    chmod 640 /etc/squid/squid.conf
    chown root:squid /etc/squid/squid.conf
    chcon system_u:object_r:squid_conf_t:s0 /etc/squid/squid.conf
}

cert_setup() {
    az login --service-principal -u ${CLIENT_ID} -p ${CLIENT_SECRET} --tenant ${TENANT_ID} &&
    az account set -s ${SUBSCRIPTION} &&
    az storage blob download --container-name squid --account-name ${ACCOUNT_NAME} --file ${SQD_CERT_NAME} --name ${SQD_CERT_NAME}
    cat ${SQD_CERT_NAME} > /etc/squid/ssl_cert/${SQD_CERT_NAME}
}

write_config() {
    cat /home/adminuser/squid_config.txt > /etc/squid/squid.conf
}

start_squid() {
    systemctl enable squid
    systemctl restart squid
    echo $(systemctl status squid)
}

open_port_3128() {
    yum -y install firewalld

    systemctl unmask firewalld
    systemctl start firewalld
    systemctl enable firewalld
    echo $(systemctl status firewalld)
    sleep 5

    /usr/bin/firewall-cmd --permanent --add-port=3128/tcp
    /usr/bin/firewall-cmd --reload
}

main() {
    install_dependencies
    set_permissions
    cert_setup
    write_config
    start_squid
    open_port_3128
    exit
}

main