#!/bin/bash


echo "Total number of folders (including all nested ones) = $totalfold"
echo -e "TOP 5 folders of maximum size arranged in descending order (path and size):\n$top5fold"
echo "Total number of files = $totalfile"
echo "Number of:  
Configuration files (with the .conf extension) = $maxconf
Text files = $maxtxt
Executable files = $maxexe
Log files (with the extension .log) = $maxlog
Archive files = $maxarh
Symbolic links = $maxsl"
echo -e "TOP 10 files of maximum size arranged in descending order (path, size and type):\n$topFILE"
echo -e "TOP 10 executable files of the maximum size arranged in descending order (path, size and MD5 hash of file):\n$topEXE"
