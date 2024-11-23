#!/usr/bin/env bash

# arguments in ordinal sequence: 1-logFilePath, 2-rstudio_gurobi_package, 3-artifactory_url, 4-gurobi_license_file 5-manager_server 6-hostname
logPrefix="`date --rfc-3339=seconds` :"
logFileDescriptor="Install Gurobi Services: "

echo "$logPrefix $logFileDescriptor Entering vm_gurobi_softwares.sh" >> $1

sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc

echo -e "[azure-cli]
name=Azure CLI
baseurl=https://packages.microsoft.com/yumrepos/azure-cli
enabled=1
gpgcheck=1
gpgkey=https://packages.microsoft.com/keys/microsoft.asc" | sudo tee /etc/yum.repos.d/azure-cli.repo

sudo dnf install azure-cli

echo "$logPrefix $logFileDescriptor Trust root DigiCert certificate" >> $1
sudo chmod go+rwx /etc/pki/ca-trust/source/anchors
cd /etc/pki/ca-trust/source/anchors
sudo curl "https://$3/artifactory/non-CRAN-local-repo/DigiCertGlobalRootCA.crt" -o "DigiCertGlobalRootCA.crt"
sudo curl "https://$3/artifactory/non-CRAN-local-repo/DigiCertGlobalG2TLSRSASHA2562020CA1.crt" -o "DigiCertGlobalG2TLSRSASHA2562020CA1.crt"
sudo update-ca-trust force-enable
sudo update-ca-trust extract

# Install Gurobi
echo "$logPrefix $logFileDescriptor Install Gurobi Service" >> $1


# Gurobi Script to Setup Remote Services and License

echo "$logPrefix $logFileDescriptor Downloading Gurobi Tar file" >> $1
sudo curl -O https://$3/artifactory/non-CRAN-local-repo/$2

echo "$logPrefix $logFileDescriptor Moving, Gurobi Package to the Location : /opt/gurobi_server9.5.0_linux64.tar.gz"
sudo mv gurobi_server9.5.0_linux64.tar.gz /opt/gurobi_server9.5.0_linux64.tar.gz

cd /opt

echo "$logPrefix $logFileDescriptor Giving Execute Permissions to the Gurobi File" >> $1
sudo chmod +x /opt/gurobi_server9.5.0_linux64.tar.gz

echo "$logPrefix $logFileDescriptor Extracting the Gurobi Package" >> $1
sudo tar xvfz gurobi_server9.5.0_linux64.tar.gz
sudo mv /opt/gurobi_server950 /opt/gurobi

echo "$logPrefix $logFileDescriptor Listing the Items in the Gurobi Directory" >> $1
cd /opt/gurobi/linux64/bin
ls -ltr >> $1

echo "$logPrefix $logFileDescriptor Changing to the Home directory" >> $1
cd /home/azureuser/

echo "$logPrefix $logFileDescriptor Downloading Gurobi License file" >> $1
sudo curl -O https://$3/artifactory/non-CRAN-local-repo/$4 >> $1

echo "$logPrefix $logFileDescriptor Move the License file to /opt/gurobi/" >> $1
sudo mv $4 /opt/gurobi/gurobi.lic
ls -ltr /opt/gurobi/ >> $1

echo "$logPrefix $logFileDescriptor  Adding ENV path and Variables in environment file" >> $1
sudo tee /etc/environment <<EOT
GRB_LICENSE_FILE=/opt/gurobi/gurobi.lic
GUROBI_HOME=/opt/gurobi/linux64
EOT

echo "$logPrefix $logFileDescriptor changing directory to gurobi/linux64/bin/" >> $1
cd /opt/gurobi/linux64/bin/

echo "$logPrefix $logFileDescriptor Execute grbprobe to get server's host id" >> $1
./grbprobe >> $1

echo "$logPrefix $logFileDescriptor Install the Gurobi Remote Services" >> $1
./grb_rs install >> $1

echo "$logPrefix $logFileDescriptor Update grb_rsm.cnf file" >> $1
sudo sed -i '/PORT/d' /opt/gurobi/linux64/bin/grb_rs.cnf
sudo sed -i '/HOSTNAME/d' /opt/gurobi/linux64/bin/grb_rs.cnf
sudo sed -i '/MANAGER/d' /opt/gurobi/linux64/bin/grb_rs.cnf

export manager_server=$5
export hostname=$6

echo "

HOSTNAME=$hostname
PORT=61000
MANAGER=https://$manager_server

" >> /opt/gurobi/linux64/bin/grb_rs.cnf

./grb_rs restart >> $1

#linux firewall
sudo firewall-cmd --permanent --add-port=61080/tcp
sudo firewall-cmd --permanent --add-port=61000/tcp
sudo firewall-cmd --permanent --add-port=37173/tcp
sudo firewall-cmd --permanent --add-port=443/tcp
sudo firewall-cmd --permanent --add-port=80/tcp
sudo firewall-cmd --reload
sudo firewall-cmd --list-all