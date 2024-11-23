#!/bin/bash

################################################################################################
# Requirements:     Ubuntu 18.04 VM  
# Purpose:          Installs software necessary to run a service that checks 
#                   into Azure DevOps and joins a specified agent pool.
# Prerequisites:    The following variables must be supplied:
#                       * parameter 1 -> DevOps organization (ie. co-azurecore)
#                       * parameter 2 -> Personal Access Token. Token must have 
#                                             "agent pool Read & Manage" permissions. In addition,
#                                             Azure DevOps Org must not have MFA policy activated.
#                       * parameter 3 -> The name of the pool agents will join. 
#                                               Pool MUST exist in ADO first.
#################################################################################################  

DEBIAN_FRONTEND=noninteractive
DOCKER_CHANNEL=stable
DOCKER_VERSION="19.03.8"
LOG_FILE=/var/log/initialization.log
ADMIN_USER=`awk -v val=1000 -F ":" '$3==val{print $1}' /etc/passwd`

VSTS_ACCOUNT=$1
# User with admin privileges over co-azurecore can create a Personal Access Token. 
# Add token to pipeline variables before deploying.
VSTS_TOKEN=$2 
# Create the pool in Azure DevOps first and then add the pool name to the pipeline varialbes.
VSTS_POOL=$3 

sudo touch $LOG_FILE

echo "Update repositories" 2>&1 | sudo tee -a $LOG_FILE
sudo apt update 2>&1 | sudo tee -a $LOG_FILE

sudo echo "APT::Get::Assume-Yes \"true\";" > /etc/apt/apt.conf.d/90assumeyes

sudo apt-get install -y --no-install-recommends \
software-properties-common \
apt-utils \
apt-transport-https \
build-essential \
ca-certificates \
lsb-release \
python-all \
rlwrap \
curl \
git \
jq \
libunwind8 \
libicu60 \
netcat \
unzip 2>&1 | sudo tee -a $LOG_FILE

# Accept the TEE EULA
sudo mkdir -p "/root/.microsoft/Team Foundation/4.0/Configuration/TEE-Mementos" 2>&1 | sudo tee -a $LOG_FILE
sudo echo '<ProductIdData><eula-14.0 value="true"/></ProductIdData>' > "/root/.microsoft/Team Foundation/4.0/Configuration/TEE-Mementos/com.microsoft.tfs.client.productid.xml" 2>&1 | sudo tee -a $LOG_FILE

# Install Docker for pushing to the repository
set -ex
sudo curl -fL "https://download.docker.com/linux/static/${DOCKER_CHANNEL}/`uname -m`/docker-${DOCKER_VERSION}.tgz" -o docker.tgz
sudo tar --extract --file docker.tgz --strip-components 1 --directory /usr/local/bin 2>&1 | sudo tee -a $LOG_FILE
sudo rm docker.tgz 2>&1 | sudo tee -a $LOG_FILE
sudo docker -v 2>&1 | sudo tee -a $LOG_FILE

# Install kubectl
sudo curl -LO https://storage.googleapis.com/kubernetes-release/release/$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/linux/amd64/kubectl
sudo chmod +x ./kubectl 2>&1 | sudo tee -a $LOG_FILE
sudo mv ./kubectl /usr/local/bin 2>&1 | sudo tee -a $LOG_FILE

# Install Azure cli
curl -sL https://aka.ms/InstallAzureCLIDeb | sudo bash 2>&1 | sudo tee -a $LOG_FILE

# Install Azure DevOps cli extension
sudo az extension add --name azure-devops 2>&1 | sudo tee -a $LOG_FILE

# Install Terraform
sudo curl https://releases.hashicorp.com/terraform/0.12.25/terraform_0.12.25_linux_amd64.zip > terraform_0.12.25_linux_amd64.zip
sudo unzip terraform_0.12.25_linux_amd64.zip 2>&1 | sudo tee -a $LOG_FILE
sudo mv terraform /usr/bin 2>&1 | sudo tee -a $LOG_FILE
sudo ln -s /usr/bin/terraform /usr/bin/terraform12
sudo rm terraform_0.12.25_linux_amd64.zip 2>&1 | sudo tee -a $LOG_FILE

# Install PowerShell
sudo curl -s https://packages.microsoft.com/config/ubuntu/18.04/packages-microsoft-prod.deb > packages-microsoft-prod.deb
sudo dpkg -i packages-microsoft-prod.deb
# to avoid locking issue
sleep 3
sudo apt-get update
sleep 3
sudo apt-get install -y powershell 2>&1 | sudo tee -a $LOG_FILE

# Install Helm
sudo curl https://helm.baltorepo.com/organization/signing.asc | sudo apt-key add -
echo "deb https://baltocdn.com/helm/stable/debian/ all main" | sudo tee /etc/apt/sources.list.d/helm-stable-debian.list
sleep 3
sudo apt-get update
sleep 3
sudo apt-get install helm 2>&1 | sudo tee -a $LOG_FILE

# Download the DevOps Agent installer
sudo su -c "curl -s https://vstsagentpackage.azureedge.net/agent/2.172.2/vsts-agent-linux-x64-2.172.2.tar.gz > /home/$ADMIN_USER/vsts-agent-linux-x64-2.172.2.tar.gz" $ADMIN_USER 2>&1 | sudo tee -a $LOG_FILE
sudo su -c "tar -zxvf /home/$ADMIN_USER/vsts-agent-linux-x64-2.172.2.tar.gz -C /home/$ADMIN_USER" $ADMIN_USER 2>&1 | sudo tee -a $LOG_FILE

# Check in to the DevOps Agent Pool
sudo su -c "/home/$ADMIN_USER/bin/Agent.Listener configure --unattended --agent $(hostname) --url https://$VSTS_ACCOUNT.visualstudio.com --auth PAT --token $VSTS_TOKEN --pool $VSTS_POOL --work _work --acceptTeeEula --replace" $ADMIN_USER

cd /home/$ADMIN_USER

sudo ./svc.sh install 2>&1 | sudo tee -a $LOG_FILE

sudo ./svc.sh start 2>&1 | sudo tee -a $LOG_FILE

# Install PowerShell Modules
sudo pwsh -Command 'Set-PSRepository -Name "PSGallery" -InstallationPolicy Trusted'
sudo pwsh -Command 'Install-Module -Name Az -AllowClobber -Scope AllUsers'
