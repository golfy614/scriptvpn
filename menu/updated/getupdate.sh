#!/bin/bash
# My Telegram : https://t.me/yallaaj
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
# IZIN=$(curl https://raw.githubusercontent.com/lujake359/ayunat/main/pai | grep $MYIP | awk '{print $3}')
# if [ $MYIP = $MYIP ]; then
# echo -e "${NC}${GREEN}ได้รับอนุญาติ...${NC}"
# else
# echo -e "${NC}${RED}คุณไม่ได้รับสิทธิเข้าใช้งาน!${NC}";
# echo -e "${NC}${LIGHT}ติดต่อแอดมิน!!"
# echo -e "${NC}${LIGHT}Telegram : https://t.me/yallaaj"
# exit 0
# fi
clear
javaup="https://raw.githubusercontent.com/wehoi/freesc/main/update"
# change direct
cd /usr/bin
# remove file
rm menu
rm -rf menu
# Download update
wget -O menu "https://${javaup}/menu.sh"
wget -O maddssh "https://${javaup}/maddssh.sh"
wget -O mbackup "https://${javaup}/mbackup.sh"
wget -O maddxray "https://${javaup}/maddxray.sh"
wget -O msetting "https://${javaup}/msetting.sh"
wget -O start-menu "https://${javaup}/start-menu.sh"
# change Permission
chmod +x menu
chmod +x maddssh
chmod +x maddxray
chmod +x mbackup
chmod +x msetting
chmod +x start-menu
#change direct
cd /root
# clear
clear
echo -e "Succes Update Menu"
sleep 3
