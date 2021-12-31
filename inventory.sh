#!/bin/bash
# Description: script that can be used for a full server inventory
# Author: ulrich njike
# Date: december 27 2021
# Email: ulrichnjike42@gmail.com
# Github: https://githu.com/ulrichnjike


echo " The os version is ${OS} "
OS= cat /etc/*release | head -1

echo " The size of the memory is ${MS} "
MS= cat /proc/meminfo | head -1

echo " The size of harddrive is ${HD} "
HD= lsblk | grep disk| awk '{print$4}'

echo " The CPU speed is ${CS} "
CS= lscpu | grep "CPU MHz" | awk '{print$3}'

echo " The kernel version is ${KV} "
KV= uname -r | awk -F. '{ print $1 "." $2 }'

echo " The system bits is ${SB} "
SB= arch

echo " The hostname is ${HM} "
HM= hostname

echo " The ip address is ${IP} "
IP= hostname -I | awk '{print $1}'

echo " The following open port is ${OP} "
OP= ss -tulpn | grep LISTEN

echo " The DNS is ${DNS} "
DNS= cat /etc/resolv.conf | grep nameserver

echo " The manufacturer is ${MAN} "
MAN= dmidecode -t system | grep Manufacturer

echo " The system family is ${SV} "
SV= dmidecode -t system | grep Family | awk '{print$2,$3}'

echo " The Mac address is ${MAC} "
MAC= ip a | grep ether | head -1 | awk '{print $2}'

