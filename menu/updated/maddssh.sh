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
OK="${GREEN}[OK]${NC}"
Error="${RED}[Mistake]${NC}"
BRED="\e[41m"
BBLUE="\e[38;5;21m"
# ==========================================
#information
OK = "$ {
  Green
}[OK]$ {
  Font
}"
Error = "$ {
  Red
}[Mistake]$ {
  Font
}"
clear
echo -e ""
echo -e "************************************************************"
echo -e "******************* WELCOME TO JAVANET *********************"
echo -e "****************** Auto Scrip By jAvaNet *******************"
echo -e "**LINE:javanet**** Whatsapp:+66934567688 *****FB:javajaja***"
echo -e "************************************************************"
echo -e "                       SSH Tunnel"
echo -e "************************************************************"
echo -e "$NC 1. สร้างบัญชี SSH TLS   "
echo -e "$NC 2. กลับไปยังเมนูหลัก     "
echo -e "************************************************************"
read -p " ➣ โปรดเลือก [ 1 - 2 ]:  " menu
echo -e ""
case $menu in
1)
addssh
;;
2)
menu
;;
*)
clear
bash menu
;;
esac
#
