#!/bin/bash
# ==========================================
# Color
RED='\033[0;31m'
NC='\033[0m'
GREEN='\033[0;32m'
ORANGE='\033[0;33m'
BLUE='\033[0;34m'
PURPLE='\033[0;35m'
CYAN='\033[0;36m'
LIGHT='\033[0;37m'
# ==========================================
#information
OK="${GREEN}[OK]${NC}"
Error="${RED}[Mistake]${NC}"
clear
echo -e "************************************************************"
echo -e "*************** WELCOME TO XRAY AUTO SCRIPT ****************"
echo -e "****************** Auto Scrip By JAVANET *******************"
echo -e "************************************************************"
echo -e "                    ข้อมูลวีพีเอส                "
echo -e "************************************************************"
ISP=$(curl -s ipinfo.io/org | cut -d " " -f 2-10 )
CITY=$(curl -s ipinfo.io/city )
WKT=$(curl -s ipinfo.io/timezone )
IPVPS=$(curl -s ipinfo.io/ip )
jam=$(date +"%T")
hari=$(date +"%A")
tnggl=$(date +"%d-%B-%Y")
domain=$(cat /etc/xray/domain)
echo -e "* TIME          : $jam"
echo -e "* DAY           : $hari"
echo -e "* DATE          : $tnggl"
echo -e "* SERVER        : $ISP"
echo -e "* City          : $CITY"
echo -e "* IP VPS        : $IPVPS"
echo -e "* DOMAIN        : $domain"
echo -e "************************************************************"
echo -e                      เมนูหลัก       
echo -e "************************************************************"
echo -e "$NC          1$NC. สร้างบัญชี              "
echo -e "$NC          2$NC. รีสตาร์ทบริการทั้งหมด          "
echo -e "$NC          3$NC. ตรวจสอบพอร์ต             "
echo -e "$NC          4$NC. ตรวจสอบบริการ                 "
echo -e "$NC          5$NC. ตั้งค่า                  "
echo -e "$NC          6$NC. ออก                        "
echo -e "************************************************************"
echo -e "$NC หากตรวจเจอปัญหาติดต่อแอดมิน Telegram https://t.me/java00777 "  
echo -e "$NC Copyright JAVA " 
echo -e "************************************************************"
read -p " โปรดเลือก [ 1 - 6 ] : " menu
echo -e "************************************************************"
echo -e ""
case $menu in
1)
maddxray
;;
2)
restart-xray
;;
3)
cek-port
;;
4)
start-menu
;;
5)
msettings
;;
5)
clear
exit
;;
*)
clear
menu
;;
esac
#
