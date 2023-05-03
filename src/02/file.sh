#!/bin/bash

read -p "Сохранить? [Y/N] " answer
case $answer in
y | Y) ./info.sh >$file;;
*) echo "Не сохранено";;
esac 