#!/usr/bin/env bash

# arguments in ordinal sequence $1-logFilePath $2-artifactory_url $3-code_server_package

logPrefix="`date --rfc-3339=seconds` :"
logFileDescriptor="Install Code Server:  "
echo "$logPrefix $logFileDescriptor Starting " >> $1
export code_server_full_url="$2/artifactory/rpm-local-repo/$3"
echo "$logPrefix $logFileDescriptor Downloading code-server package" >> $1
wget -nd $code_server_full_url
echo "$logPrefix $logFileDescriptor Installing $3 package" >> $1
sudo rpm -i $3
echo "$logPrefix $logFileDescriptor Enabling $3 package" >> $1
sudo systemctl enable --now code-server@USER