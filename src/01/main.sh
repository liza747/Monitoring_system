#!/bin/bash

if [ -n "$1" ] && [ -z "$2" ] && [[ "$1" =~ ^[[:alpha:]]+$ ]]; then 
echo $1
else
echo Invalid format
fi