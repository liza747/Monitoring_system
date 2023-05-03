#!/bin/bash

export time=$(date +%s.%N)
if [ -z "$1" ] || [ $# -ne 1 ] || ! [ -d $1 ] || ! [[ $1 =~ /$ ]]
    then
    echo "Ошибка ввода. Укажите директорию в формате: /var/log/"
    exit
fi

export totalfold=$(find $1 -depth -type d 2>/dev/null | wc | awk '{print $1}')
export totalfile=$(find $1 -depth -type f 2>/dev/null | wc | awk '{print $1}')
export top5fold=$(du -h $1 2>/dev/null | sort -rn | head -n 5 | cat -n | awk '{print $1 " - " $3", " $2 }' | sed -e 's/K/ Kb/g; s/M/ Mb/g; s/G/ Gb/g')
export maxconf=$(find $1 -type f -name "*.conf" 2>/dev/null | wc | awk '{print $1}')
export maxtxt=$(find $1 -type f -name "*.txt" 2>/dev/null | wc | awk '{print $1}')
export maxexe=$(find $1 -type f -executable 2>/dev/null | wc | awk '{print $1}')
export maxlog=$(find $1 -type f -name "*.log" 2>/dev/null | wc | awk '{print $1}')
export maxarh=$(find $1 -regextype posix-extended -regex '.*\.(7z|deb|pkg|rar|tar|zip)$' 2>/dev/null | wc | awk '{print $1}')
export maxsl=$(find $1 -depth -type l 2>/dev/null | wc | awk '{print $1}')
top10maxsize=$(find $1 -type f 2>/dev/null -exec du -h {} + | sort -rn | head -n 10 | cat -n | awk '{print $1 " - " $3", "$2}' | sed -e 's/K/ Kb/g; s/M/ Mb/g; s/G/ Gb/g')
type=$(find $1 -type f 2>/dev/null -exec du -h {} + | sort -rn | head -n 10 | cat -n | awk '{print $3}')
function res1 {
i=1
for var in ${type[*]}
do
param=$(echo "$top10maxsize" | awk -v var=$i 'NR==var {print $0}' | sed 'N; s/\n/ /')
param2=$(echo "$type" | awk -v var=$i 'NR==var  {print $NF}' | awk -F/ '{print $NF}' | awk -F. '{if ($1 != $NF) printf ", %s", $NF}')
    echo "$param${param2#*.}"
    i=$((i + 1))
done
} 
export topFILE=$(res1)
top10exemaxsize=$(find $1 -type f -executable 2>/dev/null -exec du -h {} +| sort -rn | head -n 10 | cat -n | awk '{print $1 " - " $3", "$2}')
hash=$(find $1 -type f -executable 2>/dev/null -exec md5sum {} + | sort -rn | head -n 10 | cat -n | awk '{print $2}')
function res2 {
i=1
for var in ${hash[*]}
do
    param=$(echo "$top10exemaxsize" | awk -v var=$i 'NR==var {print $0}' | sed 'N; s/\n/ /')
    echo "$param, $var"
    i=$((i + 1))
done
} 
export topEXE=$(res2)

chmod +x ./info.sh
./info.sh
timeout=$(echo "$(date +%s.%N)-$time" | bc)
printf "Script execution time (in seconds) = %.2f\n" $timeout
