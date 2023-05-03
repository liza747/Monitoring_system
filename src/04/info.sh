#!/bin/bash

echo -e "${fb1}HOSTNAME$n = $fb2$HOSTNAME$n"
echo -e "${fb1}TIMEZONE$n = $fb2$myTIMEZONE$n"
echo -e "${fb1}USER$n = $fb2$USER$n"
echo -e "${fb1}OS$n = $fb2$myOS$n"
echo -e "${fb1}DATE$n = $fb2$myDATE$n"
echo -e "${fb1}UPTIME$n = $fb2$myUPTIME$n"
echo -e "${fb1}UPTIME_SEC$n = $fb2$myUPTIME_SEC$n"
echo -e "${fb1}IP$n = $fb2$myIP$n"
echo -e "${fb1}MASK$n = $fb2$myMASK$n"
echo -e "${fb1}GATEWAY$n = $fb2$myGATEWAY$n"
echo -e "${fb1}RAM_TOTAL$n = $fb2$myRAM_TOTAL Gb$n"
echo -e "${fb1}RAM_USED$n = $fb2$myRAM_USED Gb$n" 
echo -e "${fb1}RAM_FREE$n = $fb2$myRAM_FREE Gb$n"
echo -e "${fb1}SPACE_ROOT$n = $fb2$mySPACE_ROOT Mb$n"
echo -e "${fb1}SPACE_ROOT_USED$n = $fb2$mySPACE_ROOT_USED Mb$n"
echo -e "${fb1}SPACE_ROOT_FREE$n = $fb2$mySPACE_ROOT_FREE Mb$n"
# if [ -z $(awk -F= 'NR==1{print $2}' config.cfg) ] || [[ $(cat config.cfg) =~ '#' ]]
