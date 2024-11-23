#!/usr/bin/env bash

# arguments in ordinal sequence: 1-logFilePath, 2-vm_name, 3-domain_name<UPPER>, 4-domain_join_user@<UPPER>, 5-domain_join_password, ou_domain_name_lower

logPrefix="`date --rfc-3339=seconds` :"
logFileDescriptor="Join Domain:  "

echo "$logPrefix $logFileDescriptor Starting " >> $1

echo "$logPrefix $logFileDescriptor info: /etc/hosts shows that this vm was not previously domain joined " >> $1
echo "$logPrefix $logFileDescriptor Join Domain Steps Starting " >> $1

echo "$logPrefix $logFileDescriptor Yum install domain package dependencies Starting " >> $1
sudo yum --disablerepo="*" --enablerepo="rpm-local-repo,rpm-8-base" -y install realmd sssd krb5-workstation krb5-libs samba-common-tools oddjob oddjob-mkhomedir adcli >> $1
echo "$logPrefix $logFileDescriptor Yum install domain package dependencies Complete " >> $1

echo "$logPrefix $logFileDescriptor Configure /etc/hosts file Starting " >> $1
sed -i "s/127.0.0.1/#127.0.0.1/" /etc/hosts
echo "127.0.0.1 $2.$3 $2 localhost" >> /etc/hosts
echo "$logPrefix $logFileDescriptor Configure /etc/hosts file Complete " >> $1

echo "$logPrefix $logFileDescriptor sudo realm discover: $3 Starting " >> $1
realm discover $3
echo "$logPrefix $logFileDescriptor sudo realm discover: $3 Complete " >> $1

echo "$logPrefix $logFileDescriptor kinit: $4 Starting " >> $1
echo $5 | kinit $4
echo "$logPrefix $logFileDescriptor kinit: $4 Starting " >> $1

echo "$logPrefix $logFileDescriptor sudo realm join: $3 user_name: $4 Starting " >> $1
echo $5 | sudo sudo realm join --verbose --computer-ou="OU=AADDC Computers,DC=$6,DC=local" --user=$4 $3 >> $1
echo "$logPrefix $logFileDescriptor sudo realm join: $3 user_name: $4 Complete " >> $1

echo "$logPrefix $logFileDescriptor Join Domain Steps Complete " >> $1

echo "$logPrefix $logFileDescriptor Complete " >> $1
echo '' >> $1
 