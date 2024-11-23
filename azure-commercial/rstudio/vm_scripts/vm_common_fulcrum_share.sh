#!/usr/bin/env bash

# arguments in ordinal sequence $1-share $2-service-account $3-password

# Install utils nfs-common
sudo dnf install nfs-utils -y

# Create /mnt/fulcrum dir
sudo mkdir /mnt/fulcrum
if [ ! -d "/etc/smbcredentials" ]; then
# Create /etc/smbcredentials dir
sudo mkdir /etc/smbcredentials
fi
if [ ! -f "/etc/smbcredentials/fulcrum_share.cred" ]; then
# Create credentials file
    sudo bash -c "echo 'username=$2' >> /etc/smbcredentials/fulcrum_share.cred"
    sudo bash -c "echo 'password=$3' >> /etc/smbcredentials/fulcrum_share.cred"
fi
# Only root can read the file
sudo chmod 600 /etc/smbcredentials/fulcrum_share.cred

# Save to fstab, to automount
sudo bash -c "echo '//$1.file.core.windows.net/fulcrum /mnt/fulcrum cifs nofail,credentials=/etc/smbcredentials/fulcrum_share.cred,dir_mode=0777,file_mode=0777,serverino,nosharesock,actimeo=30' >> /etc/fstab"

#Mount the Share
sudo mount -t cifs //$1.file.core.windows.net/fulcrum /mnt/fulcrum -o credentials=/etc/smbcredentials/fulcrum_share.cred,dir_mode=0777,file_mode=0777,serverino,nosharesock,actimeo=30 -v