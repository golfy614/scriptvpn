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
echo -e ""
echo -e "************************************************************"
echo -e "                       XRAY-CORE"
echo -e "************************************************************"
echo -e "************************************************************"
echo -e "$NC 1. สร้างบัญชี Vmess   "
echo -e "$NC 2. ลบบีญชี Vmess   "
echo -e "$NC 3. ต่ออายุ Vmess   "
echo -e "$NC 4. สร้างบัญชี VLESS  "
echo -e "$NC 5. ลบบีญชี VLESS   "
echo -e "$NC 6. ต่ออายุ  VLESS   "
echo -e "$NC 7. สร้างบัญชี Trojan  "
echo -e "$NC 8. ลบบีญชี Trojan  "
echo -e "$NC 9. ต่ออายุ  Trojan  "
echo -e "$NC 10. สร้างบัญชี ShadowSocks "
echo -e "$NC 11. ลบบีญชี ShadowSocks  "
echo -e "$NC 12. ต่ออายุ  ShadowSocks  "
echo -e "$NC 13. กลับไปยังเมนูหลัก     "
echo -e "************************************************************"
read -p " ➣ โปรดเลือก [ 1 - 13 ]:  " menu
echo -e ""
case $menu in
1)
addvmess
;;
2)
dellvmess
;;
3)
rennewvmess
;;
4)
addvless
;;
5)
dellvless
;;
6)
rennewvless
;;
7)
addtrojan
;;
8)
delltrojan
;;
9)
rennewtrojan
;;
10)
addss
;;
11)
dellss
;;
12)
rennewss
;;
13)
menu
;;
*)
clear
bash menu
;;
esac
#
