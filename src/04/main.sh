#!/bin/bash

list[0]=$(awk -F= '/column1_background/{printf("%s"), $2}' config.cfg)
list[1]=$(awk -F= '/column1_font_color/{printf("%s"), $2}' config.cfg)
list[2]=$(awk -F= '/column2_background/{printf("%s"), $2}' config.cfg)
list[3]=$(awk -F= '/column2_font_color/{printf("%s"), $2}' config.cfg)
color=(white red green blue purple black)
bg_1="${list[0]} (${color[list[0] - 1]})"
fc_1="${list[1]} (${color[list[1] - 1]})"
bg_2="${list[2]} (${color[list[2] - 1]})"
fc_2="${list[3]} (${color[list[3] - 1]})"

if [ -z ${list[0]} ] || [ -z ${list[1]} ] || [ -z ${list[2]} ] || [ -z ${list[3]} ] || [[ $(cat config.cfg) =~ '#' ]]
then
export fb1="\033[35;40m"
export fb2="\033[30;45m"
export n="\033[0m"
./peremen.sh
echo -e "\nColumn 1 background = default (black)
Column 1 font color = default (purple)
Column 2 background = default (purple)
Column 2 font color = default (black)"
exit
else 
for param in ${list[*]}
do
    if ! [[ $param =~ ^[1-6]$ ]]
    then 
        echo "Ошибка. Введите 4 параметра от 1 до 6."
        exit
    elif [ ${list[0]} = ${list[1]} ] || [ ${list[2]} = ${list[3]} ] 
        then 
        echo "Ввод одинаковых параметров. Запустите скрипт еще раз."
        exit
    fi
done

for index in ${!list[*]}
do
    case ${list[index]} in
    1) list[index]=7;;  #белый
    2) list[index]=1;;  #красный
    3) list[index]=2;;  #зеленый
    4) list[index]=6;;  #голубой
    5) list[index]=5;;  #пурпурный
    6) list[index]=0;;  #черный
    esac
done

export fb1="\033[$((${list[1]}+30));$((${list[0]}+40))m"
export fb2="\033[$((${list[3]} +30));$((${list[2]}+40))m"
export n="\033[0m"

./peremen.sh
echo -e "\nColumn 1 background = $bg_1
Column 1 font color = $fc_1
Column 2 background = $bg_2
Column 2 font color = $fc_2"
fi




