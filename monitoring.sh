#!/bin/bash
arc=$(uname -a)
pcpu=$(grep 'physical id' /proc/cpuinfo | sort -u | wc -l)
vcpu=$(grep 'processor' /proc/cpuinfo | wc -l)
fram=$(free -m | awk '$1 == "Mem:" {print $2}')
uram=$(free -m | awk '$1 == "Mem:" {print $3}')
pram=$(free | awk '$1 == "Mem:" {printf("%.2f"), $3/$2*100}')
fdisk=$(df -Bg | grep '^/dev/mapper' | awk '{ft += $2} END {print ft}')
udisk=$(df -Bm | grep '^/dev/mapper' | awk '{ut += $3} END {print ut}')
pdisk=$(df -Bm | grep '^/dev/mapper' | awk '{ut += $3} {ft+= $2} END {printf("%d"), ut/ft*100}')
cpul=$(mpstat | grep 'all' | awk '{printf("%.1f%%"), 100 - $13}')
lb=$(who -b | awk '$1 == "system" {print $3 " " $4}')
lvmu=$(if [ $(/usr/sbin/lvscan | grep 'ACTIVE' | wc -l) -gt 0 ]; then echo yes; else echo no; fi)
ctcp=$(ss -t | grep -i 'ESTAB' | wc -l | tr -d '\n')
ulog=$(users | wc -w)
ip=$(hostname -I)
mac=$(ip link | awk '$1 == "link/ether" {print $2}')
cmds=$(cat /var/log/auth.log | grep 'sudo: ' | grep 'COMMAND=' | wc -l | tr -d '\n')
wall "	#Architecture: $arc
	#CPU physical: $pcpu
	#vCPU: $vcpu
	#Memory Usage: $uram/${fram}MB ($pram%)
	#Disk Usage: $udisk/${fdisk}Gb ($pdisk%)
	#CPU load: $cpul
	#Last boot: $lb
	#LVM use: $lvmu
	#Connexions TCP: $ctcp ESTABLISHED
	#User log: $ulog
	#Network: IP $ip ($mac)
	#Sudo: $cmds cmd"

