#!/bin/bash

export file=$(date +%d"_"%m"_"%y"_"%H"_"%M"_"%S".status")
export myTIMEZONE=$(timedatectl | awk -F: '/zone/{print $2}')
export myOS=$(uname -mrs)
export myDATE=$(date +%d" "%B" "%C%y" "%T)
export myUPTIME=$(uptime | awk '{print $3}')
export myUPTIME_SEC=$(cat ~/../../proc/uptime| awk 'NR=2{print $1}')
export myIP=$(ip -br a | awk 'NR==2{print $3}')
export myMASK=$(route -n | awk 'NR==4{print $3}')
export myGATEWAY=$(route -n | awk '/UG/{print $2}')
export myRAM_TOTAL=$(df /dev/sda2 -h | awk 'NR==2{print $2}')
export myRAM_TOTAL=$(vmstat -s -S M | awk '/total memory/{print $1/1000}')
export myRAM_USED=$(vmstat -s -S M | awk '/used memory/{print $1/1000}')
export myRAM_FREE=$(vmstat -s -S M | awk '/free memory/{print $1/1000}')
export mySPACE_ROOT=$(df -h /dev/sda2 | awk 'NR==2{print $2*1000}')
export mySPACE_ROOT_USED=$(df -h /dev/sda2 | awk 'NR==2{ print $3*1000 }')
export mySPACE_ROOT_FREE=$(df -h /dev/sda2 | awk 'NR==2{print $4*1000}')
chmod +x ./info.sh
chmod +x ./file.sh
./info.sh
./file.sh
