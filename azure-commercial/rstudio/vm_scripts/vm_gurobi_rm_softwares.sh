#!/usr/bin/env bash

# arguments in ordinal sequence: 1-logFilePath, 2-rstudio_gurobi_package, 3-artifactory_url, 4-gurobi_license_file, 5-mongodb_user, 6-mongodb_user_password
logPrefix="`date --rfc-3339=seconds` :"
logFileDescriptor="Install Gurobi Services: "

sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc

echo -e "[azure-cli]
name=Azure CLI
baseurl=https://packages.microsoft.com/yumrepos/azure-cli
enabled=1
gpgcheck=1
gpgkey=https://packages.microsoft.com/keys/microsoft.asc" | sudo tee /etc/yum.repos.d/azure-cli.repo

sudo dnf install azure-cli

# Install Gurobi
echo "$logPrefix $logFileDescriptor Install Gurobi Service" >> $1


# Gurobi Script to Setup Remote Services and License

echo "$logPrefix $logFileDescriptor Downloading Gurobi Tar file" >> $1
sudo curl -O https://$3/artifactory/non-CRAN-local-repo/$2

echo "Moving, Gurobi Package to the Location : /opt/gurobi_server9.5.0_linux64.tar.gz" >> $1
sudo mv gurobi_server9.5.0_linux64.tar.gz /opt/gurobi_server9.5.0_linux64.tar.gz

cd /opt

echo "$logPrefix $logFileDescriptor Giving Execute Permissions to the Gurobi File" >> $1
chmod +x /opt/gurobi_server9.5.0_linux64.tar.gz

echo "$logPrefix $logFileDescriptor Extracting the Gurobi Package" >> $1
sudo tar xvfz gurobi_server9.5.0_linux64.tar.gz
sudo chmod -R 0777 /opt/gurobi_server950

echo "$logPrefix $logFileDescriptor Listing the Items in the Gurobi Directory" >> $1
cd /opt/gurobi_server950/linux64/bin
ls

echo "$logPrefix $logFileDescriptor Copy certs to correct directory" >> $1
sudo mkdir -p /var/gurobi/sslcerts
sudo chmod -R go+rwx /var/gurobi/
cd /var/gurobi/sslcerts
cp /home/azureuser/provisioner/gurobi.fulcrum.crt .
cp /home/azureuser/provisioner/gurobi.fulcrum.pfx .

# generate pem file
sudo openssl pkcs12 -in gurobi.fulcrum.pfx -nocerts -nodes -out gurobi.fulcrum.key.pem -passin pass:

cd /opt/gurobi_server950/linux64/bin/

echo "Install the Gurobi Remote Services" >> $1
sudo ./grb_rsm install >> $1

echo "$logPrefix $logFileDescriptor Updating grb_rsm.cnf file" >> $1
sudo sed -i '/^DB_URI/d' /opt/gurobi_server950/linux64/bin/grb_rsm.cnf
sudo sed -i '/^TLS=/d' /opt/gurobi_server950/linux64/bin/grb_rs.cnf
sudo sed -i '/^TLS_CERT/d' /opt/gurobi_server950/linux64/bin/grb_rs.cnf
sudo sed -i '/^TLS_KEY/d' /opt/gurobi_server950/linux64/bin/grb_rs.cnf
sudo sed -i '/^PORT=/d' /opt/gurobi_server950/linux64/bin/grb_rs.cnf

#export mongodb_conn_string=mongodb+srv://$5:$6@mongodb-use-rstu-spi-dv-pl-0.f1p3h.mongodb.net
export mongodb_conn_string=$7

splitConnectionString=(${mongodb_conn_string//// })

string1=${splitConnectionString[0]}
string2="//$5:$6@"
string3=${splitConnectionString[1]} 

completeConnectionString=$string1$string2$string3
mongodb_conn_string=$completeConnectionString

# echo "Complete String" >> $1
# echo $mongodb_conn_string >> $1


echo "

PORT=443
TLS=true
TLS_CERT=/var/gurobi/sslcerts/gurobi.fulcrum.crt
TLS_KEY=/var/gurobi/sslcerts/gurobi.fulcrum.key.pem
DB_URI=$mongodb_conn_string

" >> /opt/gurobi_server950/linux64/bin/grb_rsm.cnf


#linux firewall
sudo firewall-cmd --permanent --add-port=61000/tcp
sudo firewall-cmd --permanent --add-port=37173/tcp
sudo firewall-cmd --permanent --add-port=443/tcp
sudo firewall-cmd --reload
sudo firewall-cmd --list-all


sudo ./grb_rsm restart
