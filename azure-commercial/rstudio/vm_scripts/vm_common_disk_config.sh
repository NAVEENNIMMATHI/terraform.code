#!/usr/bin/env bash

logPrefix="`date --rfc-3339=seconds`"
logFileDescriptor="VM Disk Configuration:    "

# Disk Overview
echo "$logPrefix [$1] $logFileDescriptor disk overview Starting " >> $1
echo "df -h"
df -h

echo "lsblk"
lsblk
echo "$logPrefix [$1] $logFileDescriptor disk overview Completed " >> $1


# OS Check
echo "$logPrefix [$1] $logFileDescriptor os disk check Starting " >> $1
echo "os disk checking"
sudo sfdisk -l /dev/sda
echo "$logPrefix [$1] $logFileDescriptor os disk check Completed " >> $1

# Root Size Check
echo "$logPrefix [$1] $logFileDescriptor set size /dev/mapper/rootvg-rootlv 10G Starting " >> $1
echo "ensure large enough /dev/mapper/rootvg-rootlv"
echo "running sudo lvextend -r -L 10G /dev/mapper/rootvg-rootlv"
lvextend -r -L 10G /dev/mapper/rootvg-rootlv
echo "$logPrefix [$1] $logFileDescriptor set size /dev/mapper/rootvg-rootlv 10G Completed " >> $1

# SDC Config
echo "$logPrefix [$1] $logFileDescriptor partition /dev/sdc Starting " >> $1
echo "partition /dev/sdc"
SDC_CHECK=$(lsblk -ln /dev/sdc1 2>&1)
if [[ "$SDC_CHECK" = "lsblk: /dev/sdc1: not a block device" ]]; then
	echo 'type=83' | sudo sfdisk /dev/sdc
else
    lsblk -ln /dev/sdc1
fi
echo "$logPrefix [$1] $logFileDescriptor set size partition /dev/sdc Completed " >> $1

echo "$logPrefix [$1] $logFileDescriptor set file system /dev/sdc Starting " >> $1
echo "make file system to /dev/sdc1"
if sudo file -sL /dev/sdc1 | grep -q UUID
then
	sudo file -sL /dev/sdc1
else
    sudo mkfs -t ext4 /dev/sdc1
fi
echo "$logPrefix [$1] $logFileDescriptor set file system /dev/sdc Completed " >> $1

echo "$logPrefix [$1] $logFileDescriptor make and mount /dev/sdc to /tmp/homeStarting " >> $1
echo "mount /tmp/home"
if [ -d "/tmp/home" ] ; then
    echo "Directory /tmp/home exists."
else
    sudo mkdir /tmp/home
	sudo mount /dev/sdc1 /tmp/home
    sudo rsync -avz /home/ /tmp/home/
    sudo restorecon -vvFR /home 
fi
echo "$logPrefix [$1] $logFileDescriptor make and mount /dev/sdc to /tmp/home Completed " >> $1

echo "$logPrefix [$1] $logFileDescriptor add entry to /etc/fstab for /dev/sdc Starting " >> $1
echo "update /etc/fstab"
OUTPUT="$(sudo blkid -s UUID -o value /dev/sdc1)"
if grep -Fq "UUID="$OUTPUT"" /etc/fstab
then
    echo "/etc/fstab already contains entry for "$OUTPUT" (/home)"
else
   echo "UUID="$OUTPUT"    /home    ext4    defaults,nofail    1    2" | sudo tee -a /etc/fstab
fi
echo "$logPrefix [$1] $logFileDescriptor add entry to /etc/fstab for /dev/sdc Completed " >> $1

# SDD Config
echo "$logPrefix [$1] $logFileDescriptor partition /dev/sdd Starting " >> $1
echo "partition /dev/sdd"
SDD_CHECK=$(lsblk -ln /dev/sdd1 2>&1)
if [[ "$SDD_CHECK" = "lsblk: /dev/sdd1: not a block device" ]]; then
	echo 'type=83' | sudo sfdisk /dev/sdd
else
    lsblk -ln /dev/sdd1
fi
echo "$logPrefix [$1] $logFileDescriptor set size partition /dev/sdd Completed " >> $1

echo "$logPrefix [$1] $logFileDescriptor set file system /dev/sdd Starting " >> $1
echo "make file system to /dev/sdd1"
if sudo file -sL /dev/sdd1 | grep -q UUID
then
	sudo file -sL /dev/sdd1
else
    sudo mkfs -t ext4 /dev/sdd1
fi
echo "$logPrefix [$1] $logFileDescriptor set file system /dev/sdd Completed " >> $1

echo "$logPrefix [$1] $logFileDescriptor make and mount /dev/sdd to /logdrive0 Starting " >> $1
echo "mount /logdrive0"
if [ -d "/logdrive0" ] ; then
    echo "Directory /logdrive0 exists."
else
    sudo mkdir /logdrive0
	sudo mount /dev/sdd1 /logdrive0
fi
echo "$logPrefix [$1] $logFileDescriptor make and mount /dev/sdd to /logdrive0 Completed " >> $1

echo "$logPrefix [$1] $logFileDescriptor add entry to /etc/fstab for /dev/sdd Starting " >> $1
echo "update /etc/fstab"
OUTPUT="$(sudo blkid -s UUID -o value /dev/sdd1)"
if grep -Fq "UUID="$OUTPUT"" /etc/fstab
then
    echo "/etc/fstab already contains entry for "$OUTPUT" (logdrive0)"
else
    echo "UUID="$OUTPUT"    /logdrive0    ext4    defaults,nofail    1    2" | sudo tee -a /etc/fstab
fi
echo "$logPrefix [$1] $logFileDescriptor add entry to /etc/fstab for /dev/sdd Completed " >> $1

# auditd.conf Settings
echo "$logPrefix [$1] $logFileDescriptor Setting /etc/audit/auditd.conf values Starting " >> $1
echo "set /etc/audit/auditd.conf values"
echo "max_log_file_action = rotate"
sudo sed -i 's/^max_log_file_action =.*/max_log_file_action = rotate/' /etc/audit/auditd.conf

echo "max_log_file = 300"
sudo sed -i 's/^max_log_file =.*/max_log_file = 300/' /etc/audit/auditd.conf

echo "num_logs = 90"
sudo sed -i 's/^num_logs =.*/num_logs = 90/' /etc/audit/auditd.conf

echo "log_file = /logdrive0/var/log/audit"
sudo sed -i 's/^log_file =.*/log_file = \/logdrive0\/var\/log\/audit.log/' /etc/audit/auditd.conf
echo "$logPrefix [$1] $logFileDescriptor Setting /etc/audit/auditd.conf values Completed " >> $1

# log rotate

# File located at : /var/lib/rstudio-server/monitor/log/rstudio-server.log
echo "$logPrefix $logFileDescriptor sudo Writing to /var/lib/rstudio-server/monitor/log/rstudio-server.log Starting " >> $1
echo '/var/lib/rstudio-server/monitor/log/rstudio-server.log' > /var/lib/rstudio-server/monitor/log/rstudio-server.log
echo '{' >> /var/lib/rstudio-server/monitor/log/rstudio-server.log
echo '   daily' >> /var/lib/rstudio-server/monitor/log/rstudio-server.log
echo '   rotate 5' >> /var/lib/rstudio-server/monitor/log/rstudio-server.log
echo '   size 300M' >> /var/lib/rstudio-server/monitor/log/rstudio-server.log
echo '   dateext' >> /var/lib/rstudio-server/monitor/log/rstudio-server.log
echo '   dateformat -%d%m%Y' >> /var/lib/rstudio-server/monitor/log/rstudio-server.log
echo '   compress' >> /var/lib/rstudio-server/monitor/log/rstudio-server.log
echo '}' >> /var/lib/rstudio-server/monitor/log/rstudio-server.log
echo "$logPrefix $logFileDescriptor Writing to /var/lib/rstudio-server/monitor/log/rstudio-server.log Complete " >> $1


echo '' >> $1