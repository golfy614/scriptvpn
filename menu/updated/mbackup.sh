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
# Getting
MYIP=$(wget -qO- ipinfo.io/ip);
echo "Checking VPS"
IZIN=$(curl https://raw.githubusercontent.com/lujake359/ayunat/main/pai | grep $MYIP | awk '{print $3}')
# if [ $MYIP = $MYIP ]; then
# echo -e "${NC}${GREEN}ได้รับอนุญาติ...${NC}"
# else
# echo -e "${NC}${RED}คุณไม่ได้รับสิทธิเข้าใช้งาน!${NC}";
# echo -e "${NC}${LIGHT}ติดต่อแอดมิน!!"
# echo -e "${NC}${LIGHT}Telegram : https://t.me/yallaaj"
# exit 0
# fi
clear
Green_font_prefix="\033[32m" && Red_font_prefix="\033[31m" && Green_background_prefix="\033[42;37m" && Red_background_prefix="\033[41;37m" && Font_color_suffix="\033[0m"
Info="${Green_font_prefix}[ON] ${Font_color_suffix}"
Error="${Red_font_prefix}[OFF]${Font_color_suffix}"
cek=$(grep -c -E "^# BEGIN_Backup" /etc/crontab)
if [[ "$cek" = "1" ]]; then
sts="${Info}"
else
sts="${Error}"
fi
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
echo -e "          ✶ การสำรองและกู้ข้อมูล ✶      "
echo -e "************************************************************"
echo -e "$NC 1$NC. เพิ่ม/เปลี่ยนอีเมล       "
echo -e "$NC 2$NC. เปลี่ยนอีเมลผู้ส่ง  " 
echo -e "$NC 3$NC. เริ่มสำรองข้อมูลอัตโนมัติ         " 
echo -e "$NC 4$NC. หยุดสำรองข้อมูลอัตโนมัติ         " 
echo -e "$NC 5$NC. สำรองข้อมูลแบบแมนนวล             " 
echo -e "$NC 6$NC. ตรวจสอบการส่งอีเมล            " 
echo -e "$NC 7$NC. กู้ข้อมูล                     " 
echo -e "$NC 8$NC. กลับไปยังเมนูหลัก                         " 
echo -e "************************************************************"
echo -e " $NC สถานะการสำรองข้อมูล $sts    "
echo -e "************************************************************"  
read -p "โปรดเลือก [ 1 - 8 ] : " menu
echo -e ""
case $menu in
1)
addemail
;;
2)
changesend
;;
3)
startbackup
;;
4)
stopbackup
;;
5)
backup
;;
6)
testsend
;;
7)
restore
;;
8)
clear
exit
;;
*)
clear
menu
;;
esac
#
