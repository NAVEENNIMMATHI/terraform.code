#!/usr/bin/env bash

# arguments in ordinal sequence: 1-logFilePath, 2-qualys_agent 3-pandoc_package 4-artifactory_url

logPrefix="`date --rfc-3339=seconds` :"
logFileDescriptor="Install Other softwares:  "

# carbon black
sudo mkdir -p /opt/carbonblack
sudo chmod go+rwx /opt/carbonblack
cd /opt/carbonblack
wget -nd https://$4/artifactory/non-CRAN-local-repo/CarbonBlackLinuxInstaller-v6.1.9.10139-AZURE.tar.gz
tar -xvf CarbonBlackLinuxInstaller-v6.1.9.10139-AZURE.tar.gz -C /opt/carbonblack
/opt/carbonblack/CarbonBlackClientSetup-linux-v6.1.9.10139.sh

# qualys
sudo yum --disablerepo="*" --enablerepo="rpm-local-repo" install $2
sudo /usr/local/qualys/cloud-agent/bin/qualys-cloud-agent.sh ActivationId=bff3f0fc-ee41-4817-af36-9ad448e0eb4b CustomerId=1dc7440b-12a3-454c-9668-a0d3c6b7ec61


# python
#yum -y install gcc openssl-devel bzip2-devel libffi-devel make
sudo mkdir -p /opt/kpmgpython
sudo chmod -R go+rx /opt/kpmgpython
# python3.7
PYTHON=$(python3.7 -V 2>&1)
if [[ "$PYTHON" == "Python 3.7.10" ]]; then
    echo "Python 3.7.10 is installed."
else
    cd /opt/kpmgpython
    wget -nd https://$4/artifactory/non-CRAN-local-repo/Python-3.7.10.tgz
    tar xzf Python-3.7.10.tgz
    cd /opt/kpmgpython/Python-3.7.10
    sudo ./configure --enable-optimizations --prefix=/opt/kpmgpython/Python-3.7.10
    sudo make install
    #ln -sf /usr/local/bin/python3.7 /usr/bin/python
fi
# python3.8
PYTHON=$(python3.8 -V 2>&1)
if [[ $PYTHON == "Python 3.8.8" ]]; then
    echo "Python 3.8.8 is installed."
else
    cd /opt/kpmgpython
    wget -nd https://$4/artifactory/non-CRAN-local-repo/Python-3.8.8.tgz
    tar xzf Python-3.8.8.tgz
    cd /opt/kpmgpython/Python-3.8.8
    sudo ./configure --enable-optimizations --prefix=/opt/kpmgpython/Python-3.8.8
    sudo make install
    #ln -sf /usr/local/bin/python3.8 /usr/bin/python
fi
# python3.9
PYTHON=$(python3.9 -V 2>&1)
if [[ $PYTHON == "Python 3.9.6" ]]; then
    echo "Python 3.9.6 is installed."
else
    cd /opt/kpmgpython
    wget -nd https://$4/artifactory/non-CRAN-local-repo/Python-3.9.6.tgz
    tar xzf Python-3.9.6.tgz
    cd /opt/kpmgpython/Python-3.9.6
    sudo ./configure --enable-optimizations --prefix=/opt/kpmgpython/Python-3.9.6
    sudo make install
    #ln -sf /usr/local/bin/python3.9 /usr/bin/python
fi
# add /usr/local/bin to path
case ":$PATH:" in
  *:usr/local/bin:*) echo it is in the path;;
  *) export PATH="/usr/local/bin:$PATH" ;;
esac
# check
python3.7 -V
python3.8 -V
python3.9 -V
# clean up
cd /opt/kpmgpython
rm -f *.tgz *.tgz.*

# pip install
sudo /opt/kpmgpython/Python-3.9.6/bin/pip3 install virtualenv
sudo /opt/kpmgpython/Python-3.9.6/bin/pip3 install --upgrade pip setuptools wheel

# add to path
sudo touch /etc/profile.d/python.sh
case ":$PATH:" in
  *:/opt/kpmgpython/Python-3.9.6/bin:*) echo it is in the path;;
  *) echo "PATH=/opt/kpmgpython/Python-3.9.6/bin:$PATH" >> /etc/profile.d/python.sh
esac
# TODO: this needs to be rerunable
#echo "PATH=/opt/kpmgpython/Python-3.9.6/bin:$PATH" > /etc/profile.d/python.sh


# pandoc
# arguments in ordinal sequence: 1-logFilePath, 2-pandoc_package
yum --disablerepo="*" --enablerepo="rpm-local-repo" install -y $3


# DataDog
#sudo DD_AGENT_MAJOR_VERSION=7 DD_API_KEY=__np_datadog_api_key__ DD_SITE="datadoghq.com" bash -c "$(curl -L https://s3.amazonaws.com/dd-agent/scripts/install_script.sh)"
# File located at : /etc/yum.repos.d/datadog.repo
#sudo bash -c "echo '[datadog]
#name = Datadog, Inc.
#baseurl = https://yum.datadoghq.com/stable/7/x86_64/
#enabled=0
#gpgcheck=1
#repo_gpgcheck=1
#gpgkey=https://keys.datadoghq.com/DATADOG_RPM_KEY_CURRENT.public
#       https://keys.datadoghq.com/DATADOG_RPM_KEY_FD4BF915.public
#       https://keys.datadoghq.com/DATADOG_RPM_KEY_E09422B3.public'" > /etc/yum.repos.d/datadog.repo
#sudo yum makecache -y
#sudo yum remove datadog-agent-base
#sudo yum install datadog-agent -y
#sudo sh -c "sed 's/api_key:.*/api_key: __np_datadog_api_key__/' /etc/datadog-agent/datadog.yaml.example > /etc/datadog-agent/datadog.yaml"
#sudo sh -c "sed -i 's/# site:.*/site: datadoghq.com/' /etc/datadog-agent/datadog.yaml"
#sudo systemctl restart datadog-agent.service


# git
sudo yum install git -y

# libgit2
sudo yum install libgit2-devel -y

# launcher configuration
sudo usermod -aG rstudio-superuser-admins rstudio-server
sudo usermod -aG server-admins rstudio-server