#!/bin/bash

list=($@)

if  [ -z "$1" ]
    then
    exit
fi

for param in $@
do
    if [ $# -ne 4 ] || ! [[ $param =~ ^[1-6]$ ]]
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