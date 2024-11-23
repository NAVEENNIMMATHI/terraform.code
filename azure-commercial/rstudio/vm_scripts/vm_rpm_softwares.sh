#!/usr/bin/env bash

# arguments in ordinal sequence: 1-logFilePath 2-rpmPackage 3-artifactory-url
# arguments in ordinal sequence: 1-logFilePath 2-rconnect-package 3-artifactory-url 4-fulcrum_domain

logPrefix="`date --rfc-3339=seconds` :"
logFileDescriptor="Install R Studio Package Manager: "

sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc

echo -e "[azure-cli]
name=Azure CLI
baseurl=https://packages.microsoft.com/yumrepos/azure-cli
enabled=1
gpgcheck=1
gpgkey=https://packages.microsoft.com/keys/microsoft.asc" | sudo tee /etc/yum.repos.d/azure-cli.repo

sudo dnf install azure-cli

sudo curl -O https://$3/artifactory/rpm-local-repo/$2
yum --disablerepo="*" --enablerepo="rpm-local-repo" install -y $2

# R Directory Permissions #
ls -l /opt
chmod -R go+rx /opt/R

# Configuring Temp Directory for RStudio Package Manager #
sudo mkdir -p /opt/rstudio-pm-temp-data
sudo chmod go+rwx /opt/rstudio-pm-temp-data

# Privileged Port Permissions for RStudio Package Manager #
sudo setcap 'cap_net_bind_service=+ep' /opt/rstudio-pm/bin/rstudio-pm

# RStudio Package Manager File Modifications #
# File located at : /etc/rstudio-pm/rstudio-pm.gcfg
echo '; Server Configuration File' > /etc/rstudio-pm/rstudio-pm.gcfg
echo '[Server]' >> /etc/rstudio-pm/rstudio-pm.gcfg
echo "Address = https://rpm.$4" >> /etc/rstudio-pm/rstudio-pm.gcfg
echo 'TempDir = /opt/rstudio-pm-temp-data' >> /etc/rstudio-pm/rstudio-pm.gcfg
echo 'UsageDataEnabled = false' >> /etc/rstudio-pm/rstudio-pm.gcfg
echo '[HTTPS]' >> /etc/rstudio-pm/rstudio-pm.gcfg
echo 'Listen = :443' >> /etc/rstudio-pm/rstudio-pm.gcfg
echo 'MinimumTLS = "1.2"' >> /etc/rstudio-pm/rstudio-pm.gcfg
echo 'Key = "/var/rstudio/sslcerts/rpm.fulcrum.key.pem"' >> /etc/rstudio-pm/rstudio-pm.gcfg
echo 'Certificate = "/var/rstudio/sslcerts/rpm.fulcrum.crt"' >> /etc/rstudio-pm/rstudio-pm.gcfg
echo '[CRAN]' >> /etc/rstudio-pm/rstudio-pm.gcfg
echo "ManifestURL = \"https://$3/artifactory/rspm-sync/\"" >> /etc/rstudio-pm/rstudio-pm.gcfg
echo 'SyncSchedule = 0 0 * * *' >> /etc/rstudio-pm/rstudio-pm.gcfg
echo '[Database]' >> /etc/rstudio-pm/rstudio-pm.gcfg
echo 'Provider = postgres' >> /etc/rstudio-pm/rstudio-pm.gcfg
echo '[Postgres]' >> /etc/rstudio-pm/rstudio-pm.gcfg

if [ "__environment_acronym__" == "p" ]; then
	echo 'URL = "postgres://usr_rspkgmgrdbadmin@pgs-use-rstudio2-spi-__environment_acronym__:__rstudio_postgresql_adminpassword__@pgs-use-rstudio2-spi-__environment_acronym__.postgres.database.azure.com:5432/pgd-use-rstu2-pkgmgr-pd?sslmode=require&options=-csearch_path=rspkgmgr_schema"' >> /etc/rstudio-pm/rstudio-pm.gcfg
else
    echo 'URL = "postgres://usr_rspkgmgrdbadmin@pgs-use-rstu-spi-__environment_acronym__:__rstudio_postgresql_adminpassword__@pgs-use-rstu-spi-__environment_acronym__.postgres.database.azure.com:5432/pgd-use-rstu-pkgmgr-__environment_acronym__?sslmode=require&options=-csearch_path=rspkgmgr_schema"' >> /etc/rstudio-pm/rstudio-pm.gcfg
fi


# Activate License
sudo /opt/rstudio-pm/bin/license-manager activate KXDY-XP4J-P5J4-DI2M-9F2N-5Y4T-ZWTA

# Restart Service
sudo systemctl stop rstudio-pm
sudo systemctl start rstudio-pm

# Enable RSMP
sudo /opt/rstudio-pm/bin/rspm list
sudo alias rspm='/opt/rstudio-pm/bin/rspm'

# Cran Repo
sudo /opt/rstudio-pm/bin/rspm create repo --name=CRAN-repo --description='CRAN'
sudo /opt/rstudio-pm/bin/rspm subscribe --repo=CRAN-repo --source=cran
sudo /opt/rstudio-pm/bin/rspm sync --type=cran

# Create the custom source ("fulcrum-src") and repo ("fulcrum") in RSPM
sudo /opt/rstudio-pm/bin/rspm create source --name=fulcrum-src
sudo /opt/rstudio-pm/bin/rspm create repo --name=fulcrum --description='Fulcrum Developed Packages'
sudo /opt/rstudio-pm/bin/rspm subscribe --repo=fulcrum --source=fulcrum-src

# Other packages
#sudo mkdir -p /rstudiopkgs/
#sudo chmod go+rwx /rstudiopkgs/
#sudo cd /rstudiopkgs/
#curl -H "X-JFrog-Art-Api:__artifactory_api_key__" -O "https://$3/artifactory/non-CRAN-local-repo/Fulcrum.Mli_1.0.1.tar.gz"
#curl -H "X-JFrog-Art-Api:__artifactory_api_key__" -O "https://$3/artifactory/non-CRAN-local-repo/LDAvis_0.3.5.tar.gz"
#curl -H "X-JFrog-Art-Api:__artifactory_api_key__" -O "https://$3/artifactory/non-CRAN-local-repo/customerml_1.0.0.tar.gz"
#curl -H "X-JFrog-Art-Api:__artifactory_api_key__" -O "https://$3/artifactory/non-CRAN-local-repo/dashboardthemes_1.0.5.tar.gz"
#curl -H "X-JFrog-Art-Api:__artifactory_api_key__" -O "https://$3/artifactory/non-CRAN-local-repo/fulcrumlogging_0.1.0.tar.gz"
#curl -H "X-JFrog-Art-Api:__artifactory_api_key__" -O "https://$3/artifactory/non-CRAN-local-repo/fulcrumlogging_0.2.0.tar.gz"
#curl -H "X-JFrog-Art-Api:__artifactory_api_key__" -O "https://$3/artifactory/non-CRAN-local-repo/fulcrumlogging_1.0.0.tar.gz"
#curl -H "X-JFrog-Art-Api:__artifactory_api_key__" -O "https://$3/artifactory/non-CRAN-local-repo/fulcrumlogging_1.0.1.tar.gz"
#curl -H "X-JFrog-Art-Api:__artifactory_api_key__" -O "https://$3/artifactory/non-CRAN-local-repo/plumber_1.0.0.tar.gz"
#curl -H "X-JFrog-Art-Api:__artifactory_api_key__" -O "https://$3/artifactory/non-CRAN-local-repo/radialNetworkR_0.1.0.tar.gz"
#curl -H "X-JFrog-Art-Api:__artifactory_api_key__" -O "https://$3/artifactory/non-CRAN-local-repo/radialNetworkR_0.1.1.tar.gz"
#curl -H "X-JFrog-Art-Api:__artifactory_api_key__" -O "https://$3/artifactory/non-CRAN-local-repo/radialNetworkR_0.1.3.tar.gz"
#curl -H "X-JFrog-Art-Api:__artifactory_api_key__" -O "https://$3/artifactory/non-CRAN-local-repo/radialNetworkR_0.1.5.tar.gz"
#curl -H "X-JFrog-Art-Api:__artifactory_api_key__" -O "https://$3/artifactory/non-CRAN-local-repo/shinyWidgets_0.4.8.910.tar.gz"
#curl -H "X-JFrog-Art-Api:__artifactory_api_key__" -O "https://$3/artifactory/non-CRAN-local-repo/stringi_1.4.4.tar.gz"

# Install stings, dashboard themes, and shinyWidgets
#rspm add --source=rstudio-internal-src --path='/rstudiopkgs/stringi_1.4.4.tar.gz'
#rspm add --source=rstudio-internal-src --path='/rstudiopkgs/dashboardthemes_1.0.5.tar.gz'
#rspm add --source=rstudio-internal-src --path='/rstudiopkgs/shinyWidgets_0.4.8.910.tar.gz'
#rspm subscribe --repo=rstudio-internal --source=rstudio-internal-src
