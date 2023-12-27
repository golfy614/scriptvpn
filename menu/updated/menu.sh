#!/bin/bash
# ==========================================
# Colors
RED='\033[0;31m'
NC='\033[0m'
GREEN='\033[0;32m'
ORANGE='\033[0;33m'
BLUE='\033[0;34m'
PURPLE='\033[0;35m'
CYAN='\033[0;36m'
LIGHT='\033[0;37m'
# ==========================================
# Information
OK="${GREEN}[OK]${NC}"
Error="${RED}[Mistake]${NC}"

clear
echo -e "────────────────────────────────────────────────────────────" | lolcat
echo -e "                          ,        ," | lolcat
echo -e "                         /(        )`" | lolcat
echo -e "                         \\ \\___   / |" | lolcat
echo -e "                         /- _  `-/  '" | lolcat
echo -e "                        (/\\ \\ \\   /\\\" | lolcat
echo -e "                        / /   | `    \\" | lolcat
echo -e "                        O O   ) /    |" | lolcat
echo -e "                        `-^--'`<     '" | lolcat
echo -e "                       (_.)  _  )   /" | lolcat
echo -e "                        `.___/`    /" | lolcat
echo -e "                          `-----' /" | lolcat
echo -e "<----.     __ /\\_     \\__" | lolcat
echo -e "<----|====O)))==) \\) /====" | lolcat
echo -e "<----'    `--' `.__,' \\" | lolcat
echo -e "                       |        |" | lolcat
echo -e "                        \\       /" | lolcat
echo -e "                ______( (_  / \\______" | lolcat
echo -e "              ,'  ,-----'   |      \\" | lolcat
echo -e "              \`--{__________)       \\/" | lolcat
echo -e "" | lolcat
echo -e "            WELCOME TO THE DRAGON SCRIPT" | lolcat
echo -e "                 Powered by jAvaNet" | lolcat
echo -e "           LINE:javanet Whatsapp:+66934567688 FB:javajaja" | lolcat
echo -e "" | lolcat
echo -e "           [ หน้าหลัก ]       " | lolcat
echo -e "────────────────────────────────────────────────────────────" | lolcat
echo -e "1. สร้างบัญชี              " | lolcat
echo -e "2. รีสตาร์ทบริการทั้งหมด          " | lolcat
echo -e "3. ตรวจสอบพอร์ต             " | lolcat
echo -e "4. ตรวจสอบบริการ                 " | lolcat
echo -e "5. ตั้งค่า                  " | lolcat
echo -e "6. ออก                        " | lolcat
echo -e "────────────────────────────────────────────────────────────" | lolcat
echo -e "หากตรวจเจอปัญหาติดต่อแอดมิน Telegram https://t.me/yallaaj"  | lolcat
echo -e "Copyright jAvaNet" | lolcat
read -p "โปรดเลือก [1 - 6] : " menu
echo -e "────────────────────────────────────────────────────────────" | lolcat
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
    6)
        clear
        exit
        ;;
    *)
        clear
        menu
        ;;
esac
