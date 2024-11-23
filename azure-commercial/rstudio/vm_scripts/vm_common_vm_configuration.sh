#!/usr/bin/env bash

# arguments in ordinal sequence: 1-logFilePath, 2-certName, 3-artifactory-url

logPrefix="`date --rfc-3339=seconds` :"
logFileDescriptor="Install R Studio Pro softwares:  "

# ssl certs
# copy certs to correct directory
sudo mkdir -p /var/rstudio/sslcerts
sudo chmod -R go+rwx /var/rstudio/
cd /var/rstudio/sslcerts
cp /home/azureuser/provisioner/$2.crt .
cp /home/azureuser/provisioner/$2.pfx .
sudo openssl pkcs12 -in $2.pfx -nocerts -nodes -out $2.key.pem -passin pass:
sudo chmod -R go+rwx /var/rstudio/
sudo chmod -R go-w /var/rstudio/
# certificate trust steps
#sudo yum -y install ca-certificates
##yum -y update ca-certificates
##yum -y reinstall ca-certificates
sudo chmod go+rwx /etc/pki/ca-trust/source/anchors
cd /etc/pki/ca-trust/source/anchors
cp /home/azureuser/provisioner/rpm.fulcrum.crt .
sudo curl "https://$3/artifactory/non-CRAN-local-repo/DigiCertGlobalRootCA.crt" -o "DigiCertGlobalRootCA.crt"
sudo curl "https://$3/artifactory/non-CRAN-local-repo/DigiCertTLSRSASHA2562020CA1-1.crt" -o "DigiCertTLSRSASHA2562020CA1-1.crt" # old cert
sudo curl "https://$3/artifactory/non-CRAN-local-repo/DigiCertGlobalG2TLSRSASHA2562020CA1.crt" -o "DigiCertGlobalG2TLSRSASHA2562020CA1.crt" # new dev cert
sudo update-ca-trust force-enable
sudo update-ca-trust extract

#linux firewall
sudo firewall-cmd --permanent --add-port=443/tcp
sudo firewall-cmd --permanent --add-port=5432/tcp
sudo firewall-cmd --reload
sudo firewall-cmd --list-all
