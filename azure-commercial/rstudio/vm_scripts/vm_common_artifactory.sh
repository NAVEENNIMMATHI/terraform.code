#!/usr/bin/env bash

logPrefix="`date --rfc-3339=seconds`"
logFileDescriptor="VM Common Artifactory:    "

# arguments in ordinal sequence: 1-logFilePath, 2-artifactory_ip, 3-artifactory_url

# Hosts file additions #

echo "$logPrefix $logFileDescriptor Host File additions Starting " >> $1
echo "$logPrefix $logFileDescriptor Search for $2    $3" >> $1
if grep -Fxq "$2    $3" /etc/hosts
then
    echo "$logPrefix $logFileDescriptor Found '$2    $3'" >> $1
else
    echo "$logPrefix $logFileDescriptor Adding '$2    $3' Starting" >> $1
    echo "$2    $3" | sudo tee -a /etc/hosts
    echo "$logPrefix $logFileDescriptor Adding '$2    $3' Completed" >> $1
fi

echo "$logPrefix $logFileDescriptor Host File additions Completed " >> $1


# Artifactory Configuration File

# File located at : /etc/yum.repos.d/artifactory.repo

echo "$logPrefix $logFileDescriptor sudo Writing to /home/azureuser/.Rprofile Starting... " >> $1

chmod 0777 /home/azureuser

echo '# .Rprofile Configuration File' > /home/azureuser/.Rprofile
echo 'local({' >> /home/azureuser/.Rprofile
echo 'r <- getOption("repos")' >> /home/azureuser/.Rprofile
echo 'r["CRAN"] <- "https://cran.rstudio.com/"' >> /home/azureuser/.Rprofile
echo "r[\"artifactory\"] <- \"https://$3/artifactory/cran-public-remote/\"" >> /home/azureuser/.Rprofile
echo 'options(repos = r)' >> /home/azureuser/.Rprofile
echo '})' >> /home/azureuser/.Rprofile

echo "$logPrefix $logFileDescriptor Writing to /home/azureuser/.Rprofile Complete " >> $1

echo "$logPrefix $logFileDescriptor sudo Writing to /etc/yum.repos.d/artifactory.repo Starting... " >> $1

echo '# Artifactory Configuration File' > /etc/yum.repos.d/artifactory.repo
echo '[rpm-local-repo]' >> /etc/yum.repos.d/artifactory.repo
echo 'name=rpm-local-repo' >> /etc/yum.repos.d/artifactory.repo
echo "baseurl=https://$3/artifactory/repo-rpm/" >> /etc/yum.repos.d/artifactory.repo
echo 'enabled=1' >> /etc/yum.repos.d/artifactory.repo
echo 'gpgcheck=0' >> /etc/yum.repos.d/artifactory.repo
echo '' >> /etc/yum.repos.d/artifactory.repo
echo '[rpm-8-base]' >> /etc/yum.repos.d/artifactory.repo
echo 'name=rpm-8-base' >> /etc/yum.repos.d/artifactory.repo
echo "baseurl=https://$3/artifactory/repo-rpm/8-stream/BaseOS/x86_64/os/" >> /etc/yum.repos.d/artifactory.repo
echo 'enabled=1' >> /etc/yum.repos.d/artifactory.repo
echo 'gpgcheck=0' >> /etc/yum.repos.d/artifactory.repo
echo '' >> /etc/yum.repos.d/artifactory.repo
echo '[rpm-8-app]' >> /etc/yum.repos.d/artifactory.repo
echo 'name=rpm-8-app' >> /etc/yum.repos.d/artifactory.repo
echo "baseurl=https://$3/artifactory/rpm-remote/8-stream/AppStream/x86_64/os/" >> /etc/yum.repos.d/artifactory.repo
echo 'enabled=1' >> /etc/yum.repos.d/artifactory.repo
echo 'gpgcheck=0' >> /etc/yum.repos.d/artifactory.repo
echo '' >> /etc/yum.repos.d/artifactory.repo
echo '[rpm-8-stream-app]' >> /etc/yum.repos.d/artifactory.repo
echo 'name=rpm-8-stream-app' >> /etc/yum.repos.d/artifactory.repo
echo "baseurl=https://$3/artifactory/rpm-remote/8-stream/AppStream/x86_64/os/" >> /etc/yum.repos.d/artifactory.repo
echo 'enabled=1' >> /etc/yum.repos.d/artifactory.repo
echo 'gpgcheck=0' >> /etc/yum.repos.d/artifactory.repo
echo '' >> /etc/yum.repos.d/artifactory.repo
echo '[rpm-8-powertools]' >> /etc/yum.repos.d/artifactory.repo
echo 'name=rpm-8-powertools' >> /etc/yum.repos.d/artifactory.repo
echo "baseurl=https://$3/artifactory/rpm-remote/8-stream/PowerTools/x86_64/os/" >> /etc/yum.repos.d/artifactory.repo
echo 'enabled=1' >> /etc/yum.repos.d/artifactory.repo
echo 'gpgcheck=0' >> /etc/yum.repos.d/artifactory.repo
echo '' >> /etc/yum.repos.d/artifactory.repo
echo '[epel]' >> /etc/yum.repos.d/artifactory.repo
echo 'name=Extra Packages for Enterprise Linux 8 - $basearch' >> /etc/yum.repos.d/artifactory.repo
echo "baseurl=https://$3/artifactory/epel-8-fedora" >> /etc/yum.repos.d/artifactory.repo
echo 'enabled=1' >> /etc/yum.repos.d/artifactory.repo
echo 'gpgcheck=0' >> /etc/yum.repos.d/artifactory.repo
echo '' >> /etc/yum.repos.d/artifactory.repo
echo '[epel-modular]' >> /etc/yum.repos.d/artifactory.repo
echo 'name=Extra Packages for Enterprise Linux Modular 8 - $basearch' >> /etc/yum.repos.d/artifactory.repo
echo "baseurl=https://$3/artifactory/epel-8-modular-fedora/" >> /etc/yum.repos.d/artifactory.repo
echo 'enabled=1' >> /etc/yum.repos.d/artifactory.repo
echo 'gpgcheck=0' >> /etc/yum.repos.d/artifactory.repo

echo "$logPrefix $logFileDescriptor Writing to /etc/yum.repos.d/artifactory.repo Complete " >> $1


# File located at : /etc/yum.repos.d/artifactory-rstudio-binaries-local.repo

echo "$logPrefix $logFileDescriptor sudo Writing to /etc/yum.repos.d/artifactory-rstudio-binaries-local.repo Starting... " >> $1

echo '# Artifactory Configuration File' > /etc/yum.repos.d/artifactory-rstudio-binaries-local.repo
echo '[rstudio-binaries-local]' >> /etc/yum.repos.d/artifactory-rstudio-binaries-local.repo
echo 'name=rstudio-binaries-local' >> /etc/yum.repos.d/artifactory-rstudio-binaries-local.repo
echo "baseurl=https://$3/artifactory/rstudio-binaries-local/" >> /etc/yum.repos.d/artifactory-rstudio-binaries-local.repo
echo 'enabled=0' >> /etc/yum.repos.d/artifactory-rstudio-binaries-local.repo
echo 'gpgcheck=0' >> /etc/yum.repos.d/artifactory-rstudio-binaries-local.repo

echo "$logPrefix $logFileDescriptor Writing to /etc/yum.repos.d/artifactory-rstudio-binaries-local.repo Complete " >> $1

# File located at : /etc/pip.conf

echo "$logPrefix $logFileDescriptor sudo Writing to /etc/pip.conf Starting... " >> $1

echo '[global]' > /etc/pip.conf
echo "index-url = https://$3/artifactory/api/pypi/remote-pypi/simple" >> /etc/pip.conf

echo "$logPrefix $logFileDescriptor Writing to /etc/pip.conf Complete " >> $1





