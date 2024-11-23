#!/usr/bin/env bash

# arguments in ordinal sequence: 1-logFilePath 2-rconnect-package 3-artifactory-url 4-rpm_ip 5-rpro_ip 6-fulcrum_domain

logPrefix="`date --rfc-3339=seconds` :"
logFileDescriptor="Install R Studio Connect: "

sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc

echo -e "[azure-cli]
name=Azure CLI
baseurl=https://packages.microsoft.com/yumrepos/azure-cli
enabled=1
gpgcheck=1
gpgkey=https://packages.microsoft.com/keys/microsoft.asc" | sudo tee /etc/yum.repos.d/azure-cli.repo

sudo dnf install azure-cli

# Install R Studio Connect
echo "$logPrefix $logFileDescriptor Install R Studio Connect" >> $1
sudo curl -O https://$3/artifactory/rpm-local-repo/$2
yum --disablerepo="*" --enablerepo="rpm-local-repo" install -y $2


# Configuring Temp Directory for RStudio Connect #
sudo mkdir -p /opt/rstudio-connect-data
sudo chmod go+rwx  /opt/rstudio-connect-data

# PostgreSQL Password Encryption for RStudio Connect #
#su root
#/opt/rstudio-connect/bin/rscadmin configure --encrypt-config-value
#echo Password = "__rstudio_postgresql_adminpassword__" | base64

# PAM configuration for RStudio Connect #
sudo cp /etc/pam.d/login /etc/pam.d/rstudio-connect
sudo cp /etc/pam.d/su /etc/pam.d/rstudio-connect-session
if grep -Fxq "ad_gpo_map_service = +rstudio-connect" /etc/sssd/sssd.conf
then
    echo "Found 'ad_gpo_map_service = +rstudio-connect'"#"$logPrefix $logFileDescriptor Found 'ad_gpo_map_service = +rstudio-connect' " >> $1
else
    echo 'ad_gpo_map_service = +rstudio-connect' | sudo tee -a /etc/sssd/sssd.conf
fi

if grep -Fxq "enumerate = false" /etc/sssd/sssd.conf
then
    echo "Found 'enumerate = false'" #"$logPrefix $logFileDescriptor Found 'enumerate = true' " >> $1
else
    echo 'enumerate = false' | sudo tee -a /etc/sssd/sssd.conf
fi

# sssd restart
sudo sss_cache -E
sudo service sssd restart

## # file mod
## echo '# RStudio Connect Session File' > /etc/pam.d/rstudio-connect-session
## echo '#%PAM-1.0' >> /etc/pam.d/rstudio-connect-session
## echo 'auth            sufficient      pam_rootok.so' >> /etc/pam.d/rstudio-connect-session
## echo '# Uncomment the following line to implicitly trust users in the "wheel" group.' >> /etc/pam.d/rstudio-connect-session
## echo '#auth           sufficient      pam_wheel.so trust use_uid' >> /etc/pam.d/rstudio-connect-session
## echo '# Uncomment the following line to require a user to be in the "wheel" group.' >> /etc/pam.d/rstudio-connect-session
## echo 'auth            required        pam_wheel.so use_uid' >> /etc/pam.d/rstudio-connect-session
## echo 'auth            substack        system-auth' >> /etc/pam.d/rstudio-connect-session
## echo 'auth            include         postlogin' >> /etc/pam.d/rstudio-connect-session
## echo 'account         sufficient      pam_succeed_if.so uid = 0 use_uid quiet' >> /etc/pam.d/rstudio-connect-session
## echo 'account         include         system-auth' >> /etc/pam.d/rstudio-connect-session
## echo 'password        include         system-auth' >> /etc/pam.d/rstudio-connect-session
## echo 'session         include         system-auth' >> /etc/pam.d/rstudio-connect-session
## echo 'session         include         postlogin' >> /etc/pam.d/rstudio-connect-session
## echo 'session         optional        pam_xauth.so' >> /etc/pam.d/rstudio-connect-session

# Connect host file entires for RStudio Connect #
if grep -Fxq "$4    rpm.$6" /etc/hosts
then
    echo "Found '$4    rpm.$6'" # "$logPrefix $logFileDescriptor Found '$4    rpm.$6' " >> $1
else
    echo "$4    rpm.$6" | sudo tee -a /etc/hosts
fi

if grep -Fxq "$5     rpro.$6" /etc/hosts
then
    echo "Found '$5     rpro.$6'" # "$logPrefix $logFileDescriptor Found '$5     rpro.$6' " >> $1
else
    echo "$5     rpro.$6" | sudo tee -a /etc/hosts
fi

if grep -Fxq "$5     rconnect.$6" /etc/hosts
then
    echo "Found '$5     rconnect.$6'" # "$logPrefix $logFileDescriptor Found '127.0.0.1     rconnect.$6' " >> $1
else
    echo "127.0.0.1     rconnect.$6" | sudo tee -a /etc/hosts
fi

# RStudio Connect File Modifications #
echo '# Server Configuration File' > /etc/rstudio-connect/rstudio-connect.gcfg
echo '[Server]' >> /etc/rstudio-connect/rstudio-connect.gcfg
echo 'SenderEmail = vananthanarayanan1@kpmg.com' >> /etc/rstudio-connect/rstudio-connect.gcfg
echo "Address = https://rconnet.$6" >> /etc/rstudio-connect/rstudio-connect.gcfg
echo 'TempDir = /opt/rstudio-connect-data' >> /etc/rstudio-connect/rstudio-connect.gcfg
echo '[HTTPS]' >> /etc/rstudio-connect/rstudio-connect.gcfg
echo 'Listen = :443' >> /etc/rstudio-connect/rstudio-connect.gcfg
echo 'Key = "/var/rstudio/sslcerts/rconnect.fulcrum.key.pem"' >> /etc/rstudio-connect/rstudio-connect.gcfg
echo 'Certificate = "/var/rstudio/sslcerts/rconnect.fulcrum.crt"' >> /etc/rstudio-connect/rstudio-connect.gcfg
echo 'MinimumTLS = "1.2"' >> /etc/rstudio-connect/rstudio-connect.gcfg
echo '[Authentication]' >> /etc/rstudio-connect/rstudio-connect.gcfg
echo 'Provider = pam' >> /etc/rstudio-connect/rstudio-connect.gcfg
echo 'Lifetime = 1d' >> /etc/rstudio-connect/rstudio-connect.gcfg
echo 'Inactivity = 6h' >> /etc/rstudio-connect/rstudio-connect.gcfg
echo '[Applications]' >> /etc/rstudio-connect/rstudio-connect.gcfg
echo 'RunAsCurrentUser = true' >> /etc/rstudio-connect/rstudio-connect.gcfg
echo '[PAM]' >> /etc/rstudio-connect/rstudio-connect.gcfg
echo 'Service = rstudio-connect' >> /etc/rstudio-connect/rstudio-connect.gcfg
echo 'Logging = true' >> /etc/rstudio-connect/rstudio-connect.gcfg
echo 'UseSession = true' >> /etc/rstudio-connect/rstudio-connect.gcfg
echo 'ForwardPassword = true' >> /etc/rstudio-connect/rstudio-connect.gcfg
echo 'PasswordLifetime = 12h' >> /etc/rstudio-connect/rstudio-connect.gcfg
echo 'SessionService = rstudio-connect-session' >> /etc/rstudio-connect/rstudio-connect.gcfg
echo '[Database]' >> /etc/rstudio-connect/rstudio-connect.gcfg
echo 'Provider = postgres' >> /etc/rstudio-connect/rstudio-connect.gcfg
echo '[Postgres]' >> /etc/rstudio-connect/rstudio-connect.gcfg
echo 'Password = "__rstudio_postgresql_adminpassword__"' >> /etc/rstudio-connect/rstudio-connect.gcfg

if [ "__environment_acronym__" == "p" ]; then
	echo 'URL = "postgres://usr_rsconndbadmin@pgs-use-rstudio2-spi-__environment_acronym__:__rstudio_postgresql_adminpassword__@pgs-use-rstudio2-spi-__environment_acronym__.postgres.database.azure.com:5432/pgd-use-rstu2-connect-pd?sslmode=require&options=-csearch_path=rsconnect_schema"' >> /etc/rstudio-connect/rstudio-connect.gcfg
else
    echo 'URL = "postgres://usr_rsconndbadmin@pgs-use-rstu-spi-__environment_acronym__:__rstudio_postgresql_adminpassword__@pgs-use-rstu-spi-__environment_acronym__.postgres.database.azure.com:5432/pgd-use-rstu-connect-__environment_acronym__?sslmode=require&options=-csearch_path=rsconnect_schema"' >> /etc/rstudio-connect/rstudio-connect.gcfg
fi

echo '[Python]' >> /etc/rstudio-connect/rstudio-connect.gcfg
echo 'Enabled = true' >> /etc/rstudio-connect/rstudio-connect.gcfg
echo 'Executable = /opt/kpmgpython/Python-3.9.6/python' >> /etc/rstudio-connect/rstudio-connect.gcfg
echo '[CORS]' >> /etc/rstudio-connect/rstudio-connect.gcfg
echo 'Enabled = true' >> /etc/rstudio-connect/rstudio-connect.gcfg
echo 'AllowOrigin = ["*"]' >> /etc/rstudio-connect/rstudio-connect.gcfg
echo '[Scheduler]' >> /etc/rstudio-connect/rstudio-connect.gcfg
echo 'MaxProcessesLimit = 50' >> /etc/rstudio-connect/rstudio-connect.gcfg
echo 'MaxProcesses = 50' >> /etc/rstudio-connect/rstudio-connect.gcfg

# Activate License
sudo /opt/rstudio-connect/bin/license-manager activate VSWA-S3P4-KQTM-C3UU-93CQ-7652-62TA


# Restart Service
sudo systemctl stop rstudio-connect
sudo systemctl start rstudio-connect


# other packages
#sudo mkdir -p /rstudiopkgs/
#sudo chmod go+rwx /rstudiopkgs/
#cd /rstudiopkgs/
#sudo yum makecache
#sudo yum --disablerepo="*" --enablerepo="rpm-local-repo" install udunits2 -y1
#sudo yum --disablerepo="*" --enablerepo="rpm-local-repo" install udunits2-devel -y
#sudo curl -H "X-JFrog-Art-Api:__artifactory_api_key__" -O "https://$3/artifactory/non-CRAN-local-repo/minqa_1.2.4.tar.gz"
#sudo curl -H "X-JFrog-Art-Api:__artifactory_api_key__" -O "https://$3/artifactory/non-CRAN-local-repo/polyclip_1.10-0.tar.gz"
#sudo curl -H "X-JFrog-Art-Api:__artifactory_api_key__" -O "https://$3/artifactory/non-CRAN-local-repo/wordcloud_2.6.tar.gz"

# create directory where Gurobi client license file will be uploaded
sudo mkdir /opt/gurobi
sudo chmod -R 0777 /opt/gurobi