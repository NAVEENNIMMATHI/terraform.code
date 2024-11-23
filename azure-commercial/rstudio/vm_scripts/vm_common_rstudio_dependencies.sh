#!/usr/bin/env bash

# arguments in ordinal sequence: 1-logFilePath 2-artifactory-url

logPrefix="`date --rfc-3339=seconds` :"
logFileDescriptor="Install R Studio Dependencies:  "

#yum install all
yum -y install curl libcurl libcurl-devel
yum -y install gcc gcc-c++ gcc-gfortran
yum -y install readline readline-devel
yum -y install libXt libXt-devel
yum -y install zlib zlib-devel
yum -y install bzip2-devel
yum -y install xz xz-devel
yum -y install pcre-devel
yum -y install cairo-devel pango-devel libpng-devel
yum -y install java-1.8.0-openjdk java-1.8.0-openjdk-devel #java-1.7.0-openjdk-devel
yum -y install libxml2-devel
yum -y install openssl-devel openssl
yum -y install texlive
yum -y install telnet
yum -y install unixODBC unixODBC-devel
yum -y install realmd sssd krb5-workstation krb5-libs samba-common-tools oddjob oddjob-mkhomedir adcli pam_krb5
yum -y install perl-devel perl-ExtUtils-MakeMaker
yum -y install pango freetype freetype-devel libart_lgpl-devel
yum -y install ca-certificates
yum -y install json-c-devel libpng-devel ncurses-devel pcre2-devel udunits2-devel
yum -y install udunits2
#yum -y install v8-devel # after epel release
yum -y install compat-openssl10
yum -y install libffi-devel make
yum -y install clang clang-devel
yum -y install libjpeg-turbo-devel
yum -y install gsl-devel
yum -y install gmp-devel
yum -y install mpfr-devel
yum -y install zlib-devel
yum -y install jq
yum -y install azure-cli

# join domain
#yum -y install realmd sssd krb5-workstation krb5-libs samba-common-tools oddjob oddjob-mkhomedir adcli

# yum clean and update
sudo yum -y clean all
sudo yum update -y
sudo yum -y makecache

# epel release and yum config
echo "* * * * * * *"
sudo yum install -y --disablerepo="*" --enablerepo="epel" epel-release
sudo sed -i 's/enabled=1/enabled=0/g' /etc/yum.repos.d/epel*.repo
sudo sed -i 's/\[epel\]/\[epel-old\]/g' /etc/yum.repos.d/epel*.repo
sudo sed -i 's/\[epel-modular\]/\[epel-modular-old\]/g' /etc/yum.repos.d/epel*.repo

# yum clean and update
sudo yum -y clean all
sudo yum update -y
sudo yum -y makecache

sudo dnf install dnf-plugins-core
sudo dnf config-manager --set-enabled "codeready-builder-for-rhel-8-*-rpms"
echo "- - - - - - -"

# V8 packages
sudo yum --disablerepo="*" --enablerepo="rpm-8-app" install brotli-devel.x86_64 -y
sudo yum --disablerepo="*" --enablerepo="rpm-8-base" install brotli.x86_64 -y
sudo yum -y module enable nodejs:13
sudo yum --disablerepo="*" --enablerepo="rpm-local-repo" install v8-devel -y
sudo yum --disablerepo="*" --enablerepo="rpm-local-repo" install v8 -y
# jar file copy (pro only? c)
cd /tmp/
sudo mkdir -p ./datadrive0/
cd /datadrive0/
sudo mkdir -p ./fulcrumfiles/
sudo chmod -R go+rwx ./fulcrumfiles/
cd ./fulcrumfiles/
sudo curl -H "X-JFrog-Art-Api:__artifactory_api_key__" -O "https://$2/artifactory/non-CRAN-local-repo/h2o.jar"


# readline check
# configure?
# /opt/kpmgpackages/readline/readline-8.0/configure --prefix=/opt/kpmgpackages/readline/readline-8.0


# sf
sudo yum --disablerepo="rpm-local-repo" install gdal -y
sudo yum --disablerepo="rpm-local-repo" install gdal-devel -y
sudo yum --disablerepo="rpm-local-repo" install proj -y
sudo yum --disablerepo="rpm-local-repo" install proj-devel -y
sudo yum --disablerepo="rpm-local-repo" install cmake -y
sudo yum --disablerepo="rpm-local-repo" install geos-devel -y
sudo yum --disablerepo="rpm-local-repo" install sqlite-devel -y
# plumber
sudo yum --disablerepo="rpm-local-repo" install libsodium -y
sudo yum --disablerepo="rpm-local-repo" install libsodium-devel -y

## # install gdal
## sudo mkdir -p /rstudiopkgs/
## sudo chmod go+rwx /rstudiopkgs/
## cd /rstudiopkgs/
## sudo curl -H "X-JFrog-Art-Api:__artifactory_api_key__" -O "https://$2/artifactory/non-CRAN-local-repo/gdal-2.2.1.tar.gz"
## tar zxvf gdal-2.2.1.tar.gz
## sudo mkdir -p /gdal-2.2.1/
## sudo chmod go+rwx /gdal-2.2.1/
## cd /rstudiopkgs/gdal-2.2.1/
## sudo ./configure --prefix=/usr/ --with-sfcgal=no --with-static-proj4
## make -j4
## make install
## sudo ldconfig
## # packages (check)
## cd /rstudiopkgs/
## sudo yum makecache
## sudo yum --disablerepo="*" --enablerepo="rpm-local-repo" install proj -y
## ln -s /usr/lib64/libproj.so.0 /usr/lib/libproj.so
## #sudo yum --disablerepo="*" --enablerepo="rpm-local-repo" install epel-release -y
## sudo yum --disablerepo="*" --enablerepo="rpm-local-repo" install proj-devel -y
## sudo yum --disablerepo="*" --enablerepo="rpm-local-repo" install proj-nad -y
## sudo yum --disablerepo="*" --enablerepo="rpm-local-repo" install proj-epsg -y
## sudo yum --disablerepo="*" --enablerepo="rpm-local-repo" install rpmfusion-free-release -y
## sudo yum --disablerepo="*" --enablerepo="rpm-local-repo" install geos-devel -y

# install R runtime
#
#   export R_VERSION=3.5.2
#	curl -O https://cdn.rstudio.com/r/centos-8/pkgs/R-${R_VERSION}-1-1.x86_64.rpm
#	sudo yum install R-${R_VERSION}-1-1.x86_64.rpm
#	/opt/R/${R_VERSION}/bin/R --version
#	sudo ln -s /opt/R/${R_VERSION}/bin/R /usr/local/bin/R
#	sudo ln -s /opt/R/${R_VERSION}/bin/Rscript /usr/local/bin/Rscript
#
sudo mkdir -p /opt/kpmgpackages
sudo mkdir -p /opt/kpmgpackages/RHOME
sudo chmod -R 0777 /opt/kpmgpackages/RHOME
sudo mkdir -p /opt/R/3.5.2
cd  /opt/kpmgpackages/RHOME
sudo curl -H "X-JFrog-Art-Api:__artifactory_api_key__" -O "https://$2/artifactory/non-CRAN-local-repo/R-3.5.2.tar.gz"
tar -xzf /opt/kpmgpackages/RHOME/R-3.5.2.tar.gz -C /opt/kpmgpackages/RHOME
cd  /opt/kpmgpackages/RHOME/R-3.5.2/
sudo chmod -R 0777 /opt/kpmgpackages/RHOME/R-3.5.2/
/opt/kpmgpackages/RHOME/R-3.5.2/configure --prefix=/opt/R/3.5.2 --enable-memory-profiling --enable-R-shlib --with-blas --with-readline --with-cairo
make -C /opt/kpmgpackages/RHOME/R-3.5.2
make install -C /opt/kpmgpackages/RHOME/R-3.5.2
sudo chmod -R 0777 /opt/R/3.5.2
#check
/opt/R/3.5.2/bin/R --version
sudo ln -s /opt/R/3.5.2/bin/R /usr/local/bin/R
sudo ln -s /opt/R/3.5.2/bin/Rscript /usr/local/bin/Rscript
# install latest verison
sudo yum install --disablerepo="rpm-local-repo" R -y

# install ODBC Driver
sudo curl https://packages.microsoft.com/config/rhel/8/prod.repo > /etc/yum.repos.d/mssql-release.repo
sudo yum remove unixODBC-utf16 unixODBC-utf16-devel #to avoid conflicts
sudo ACCEPT_EULA=Y yum install -y msodbcsql17
# optional: for bcp and sqlcmd
sudo ACCEPT_EULA=Y yum install -y mssql-tools
case ":$PATH:" in
  *:/opt/mssql-tools/bin:*) echo it is in the path;;
  *) export PATH="$PATH:/opt/mssql-tools/bin" ;;
esac
# optional: for unixODBC development headers
sudo yum install -y unixODBC-devel


