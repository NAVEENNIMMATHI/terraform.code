#!/usr/bin/env bash

# arguments in ordinal sequence: 1-logFilePath 2-RPackage 3-ArtifactoryUrl
# arguments in ordinal sequence: 1-logFilePath 2-r-package 3-artifactory-url 4-rpm_ip 5-connect_ip 6-fulcrum_domain

logPrefix="`date --rfc-3339=seconds` :"
logFileDescriptor="Install R Studio Pro softwares:  "

sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc

echo -e "[azure-cli]
name=Azure CLI
baseurl=https://packages.microsoft.com/yumrepos/azure-cli
enabled=1
gpgcheck=1
gpgkey=https://packages.microsoft.com/keys/microsoft.asc" | sudo tee /etc/yum.repos.d/azure-cli.repo

sudo dnf install azure-cli

# Install R Studio Pro
sudo curl -O https://$3/artifactory/rpm-local-repo/$2
yum --disablerepo="*" --enablerepo="rpm-local-repo" install -y $2
rstudio-server verify-installation

# Configure R Studio Pro
# arguments in ordinal sequence: 1-logFilePath, 2-rpm_ip, 3-rconnect_ip
# PAM Configuration #

echo '#!/bin/sh' > /etc/pam-script.sh
echo 'dbus-send --system --dest=com.redhat.oddjob_mkhomedir --print-reply / com.redhat.oddjob_mkhomedir.mkhomedirfor string:"$PAM_USER"' >> /etc/pam-script.sh

sudo chmod +x /etc/pam-script.sh

echo '#%PAM-1.0' > /etc/pam.d/rstudio
echo 'auth [user_unknown=ignore success=ok ignore=ignore default=bad] pam_securetty.so' >> /etc/pam.d/rstudio
echo 'auth       required     pam_warn.so' >> /etc/pam.d/rstudio
echo 'auth       required     pam_exec.so /etc/pam-script.sh' >> /etc/pam.d/rstudio
echo 'auth       include      system-auth' >> /etc/pam.d/rstudio
echo '#auth      optional     pam_mkhomedir.so skel=/etc/skel/ umask=0077' >> /etc/pam.d/rstudio
echo 'auth       optional     pam_oddjob_mkhomedir.so' >> /etc/pam.d/rstudio
echo 'account    required     pam_nologin.so' >> /etc/pam.d/rstudio
echo 'account    include      system-auth' >> /etc/pam.d/rstudio
echo 'password   include      system-auth' >> /etc/pam.d/rstudio
echo '# pam_selinux.so close should be the first session rule' >> /etc/pam.d/rstudio
echo 'session    required     pam_selinux.so close' >> /etc/pam.d/rstudio
echo 'session    required     pam_oddjob_mkhomedir.so debug' >> /etc/pam.d/rstudio
echo 'session    optional     pam_mkhomedir.so skel=/etc/skel/ umask=0077' >> /etc/pam.d/rstudio
echo 'session    required     pam_loginuid.so' >> /etc/pam.d/rstudio
echo 'session    optional     pam_console.so' >> /etc/pam.d/rstudio
echo '# pam_selinux.so open should only be followed by sessions to be executed in the user context' >> /etc/pam.d/rstudio
echo 'session    required     pam_selinux.so open' >> /etc/pam.d/rstudio
echo 'session    required     pam_namespace.so' >> /etc/pam.d/rstudio
echo 'session    optional     pam_keyinit.so force revoke' >> /etc/pam.d/rstudio
echo 'session    include      system-auth' >> /etc/pam.d/rstudio
echo '#-session   optional     pam_ck_connector.so' >> /etc/pam.d/rstudio

if grep -Fxq "ad_gpo_map_service = +rstudio" /etc/sssd/sssd.conf
then
    echo "Found 'ad_gpo_map_service = +rstudio'" #"$logPrefix $logFileDescriptor Found 'ad_gpo_map_service = +rstudio'" >> $1
else
    echo 'ad_gpo_map_service = +rstudio' | sudo tee -a /etc/sssd/sssd.conf
fi

if grep -Fxq "enumerate = false" /etc/sssd/sssd.conf
then
    echo "Found 'enumerate = false'" #echo "$logPrefix $logFileDescriptor Found 'enumerate = false'" >> $1
else
    echo 'enumerate = false' | sudo tee -a /etc/sssd/sssd.conf
fi
# sssd restart
sudo sss_cache -E
sudo service sssd restart

# Hosts file additions #
if grep -Fxq "$4    rpm.$6" /etc/hosts
then
    echo "Found '$4    rpm.$6'"#"$logPrefix $logFileDescriptor Found '$4    rpm.$6'" >> $1
else
    echo "$4    rpm.$6" | sudo tee -a /etc/hosts
fi

if grep -Fxq "$5   rconnect.$6" /etc/hosts
then
    echo "Found '$5   rconnect.$6'"#"$logPrefix $logFileDescriptor Found '$5   rconnect.$7'" >> $1
else
    echo "$5   rconnect.$6" | sudo tee -a /etc/hosts
fi

if grep -Fxq "$5     rpro.$6" /etc/hosts
then
    echo "Found '$5     rpro.$6'" # "$logPrefix $logFileDescriptor Found '127.0.0.1     rpro.$6' " >> $1
else
    echo "127.0.0.1     rpro.$6" | sudo tee -a /etc/hosts
fi

# Adding Groups
sudo groupadd rstudio-admins
sudo groupadd server-admins
sudo groupadd rstudio-superuser-admins

# R Folder Permissions
sudo chmod -R go+rx /opt/R

# File Mods #

# File located at : /etc/rstudio/rserver.conf
echo '# Server Configuration File' > /etc/rstudio/rserver.conf
echo 'www-address=0.0.0.0' >> /etc/rstudio/rserver.conf
echo 'admin-enabled=1' >> /etc/rstudio/rserver.conf
echo 'admin-group=server-admins,rstudio-admins' >> /etc/rstudio/rserver.conf
echo 'admin-superuser-group=rstudio-superuser-admins' >> /etc/rstudio/rserver.conf
echo 'ssl-enabled=1' >> /etc/rstudio/rserver.conf
echo 'ssl-certificate=/var/rstudio/sslcerts/rpro.fulcrum.crt' >> /etc/rstudio/rserver.conf
echo 'ssl-certificate-key=/var/rstudio/sslcerts/rpro.fulcrum.key.pem' >> /etc/rstudio/rserver.conf
echo 'ssl-protocols=TLSv1.2' >> /etc/rstudio/rserver.conf
echo '' >> /etc/rstudio/rserver.conf
echo '# Launcher Config' >> /etc/rstudio/rserver.conf
echo 'launcher-address=127.0.0.1' >> /etc/rstudio/rserver.conf
echo 'launcher-port=5559' >> /etc/rstudio/rserver.conf
echo 'launcher-sessions-enabled=1' >> /etc/rstudio/rserver.conf
echo 'launcher-default-cluster=Local' >> /etc/rstudio/rserver.conf
echo "launcher-sessions-callback-address=https://rpro.$6" >> /etc/rstudio/rserver.conf

# File located at : /etc/rstudio/rsession.conf
echo '# R Session Configuration File' > /etc/rstudio/rsession.conf
echo "default-rsconnect-server=https://rconnect.$6" >> /etc/rstudio/rsession.conf
echo 'allow-r-cran-repos-edit=0' >> /etc/rstudio/rsession.conf

# File located at : /etc/rstudio/repos.conf
sudo touch /etc/rstudio/repos.conf
echo "CRAN=https://rpm.$6/CRAN-repo/latest" > /etc/rstudio/repos.conf
echo "fulcrum=https://rpm.$6/fulcrum/latest" >> /etc/rstudio/repos.conf

# File located at :  /etc/rstudio/launcher.conf
sudo touch /etc/rstudio/launcher.conf
echo "[server]" > /etc/rstudio/launcher.conf
echo "address=127.0.0.1" >> /etc/rstudio/launcher.conf
echo "port=5559" >> /etc/rstudio/launcher.conf
echo "server-user=rstudio-server" >> /etc/rstudio/launcher.conf
echo "admin-group=rstudio-server" >> /etc/rstudio/launcher.conf
echo "enable-debug-logging=1" >> /etc/rstudio/launcher.conf
echo "authorization-enabled=1" >> /etc/rstudio/launcher.conf
echo "thread-pool-size=4" >> /etc/rstudio/launcher.conf
echo "" >> /etc/rstudio/launcher.conf
echo "[cluster]" >> /etc/rstudio/launcher.conf
echo "name=Local" >> /etc/rstudio/launcher.conf
echo "type=Local" >> /etc/rstudio/launcher.conf
echo "exe=/usr/lib/rstudio-server/bin/rstudio-local-launcher" >> /etc/rstudio/launcher.conf


# File located at : /etc/rstudio/jupyter.conf
sudo touch /etc/rstudio/jupyter.conf
echo "jupyter-exe=/opt/kpmgpython/Python-3.9.6/bin/jupyter" > /etc/rstudio/jupyter.conf
echo "notebooks-enabled=1" >> /etc/rstudio/jupyter.conf
echo "labs-enabled=1" >> /etc/rstudio/jupyter.conf
echo "default-session-cluster=Local" >> /etc/rstudio/jupyter.conf

# File located at : /etc/rstudio/rsession-profile
sudo touch /etc/rstudio/rsession-profile
echo "export RETICULATE_PYTHON=/opt/kpmgpython/Python-3.9.6/python" > /etc/rstudio/rsession-profile

# Activate License
sudo rstudio-server license-manager activate G9IX-GMT7-VKBB-EWFN-3DNQ-Z97F-E6TA

# Turn off SELINUX
sudo setenforce 0
sudo sed -i "s/SELINUX=enforcing/SELINUX=disabled/" /etc/sysconfig/selinux
sudo sed -i "s/SELINUX=enforcing/SELINUX=disabled/"  /etc/selinux/config


# r configure
mkdir /opt/tmp-rstudio
chmod go+rwx /opt/tmp-rstudio
export TMPDIR=/opt/tmp-rstudio
cd /opt/R/3.5.2/lib64/R/etc
cp /home/azureuser/provisioner/Rprofile.site /opt/R/3.5.2/lib64/R/etc/Rprofile.site
chmod go+rx /opt/R/3.5.2/lib64/R/etc/Rprofile.site

# jupyter setup
sudo /opt/kpmgpython/Python-3.9.6/bin/pip3 install ipykernel
sudo /opt/kpmgpython/Python-3.9.6/bin/python3 -m ipykernel install --name py3.9.6 --display-name "Python 3.9.6"

sudo /opt/kpmgpython/Python-3.9.6/bin/pip3 install jupyter jupyterlab rsp_jupyter rsconnect_jupyter
sudo /opt/kpmgpython/Python-3.9.6/bin/jupyter-nbextension install --sys-prefix --py rsp_jupyter
sudo /opt/kpmgpython/Python-3.9.6/bin/jupyter-nbextension enable --sys-prefix --py rsp_jupyter
sudo /opt/kpmgpython/Python-3.9.6/bin/jupyter-nbextension install --sys-prefix --py rsconnect_jupyter
sudo /opt/kpmgpython/Python-3.9.6/bin/jupyter-nbextension enable --sys-prefix --py rsconnect_jupyter
sudo /opt/kpmgpython/Python-3.9.6/bin/jupyter-serverextension enable --sys-prefix --py rsconnect_jupyter

# pip install
sudo /opt/kpmgpython/Python-3.9.6/bin/pip3 install altair beautifulsoup4 cloudpickle cython dask gensim keras matplotlib nltk numpy pandas pillow pyarrow requests scipy scikit-image scikit-learn scrapy seaborn spacy sqlalchemy statsmodels tensorflow xgboost


# Restart Service
sudo rstudio-server restart
sudo rstudio-launcher restart

# Other Packages
#sudo mkdir -p /rstudiopkgs/
#sudo chmod go+rwx /rstudiopkgs/
#cd /rstudiopkgs/
#sudo yum makecache
#sudo yum --disablerepo="*" --enablerepo="rpm-local-repo" install udunits2 -y
#sudo yum --disablerepo="*" --enablerepo="rpm-local-repo" install udunits2-devel -y
#sudo curl -H "X-JFrog-Art-Api:__artifactory_api_key__" -O "https://$3/artifactory/non-CRAN-local-repo/minqa_1.2.4.tar.gz"
#sudo curl -H "X-JFrog-Art-Api:__artifactory_api_key__" -O "https://$3/artifactory/non-CRAN-local-repo/polyclip_1.10-0.tar.gz"
#sudo curl -H "X-JFrog-Art-Api:__artifactory_api_key__" -O "https://$3/artifactory/non-CRAN-local-repo/wordcloud_2.6.tar.gz"

# create directory where Gurobi client license file will be uploaded:
sudo mkdir /opt/gurobi
sudo chmod -R 0777 /opt/gurobi