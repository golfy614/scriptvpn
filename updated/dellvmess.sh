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
echo "กำลังตรวจสอบ"
IZIN=$(curl https://raw.githubusercontent.com/lujake359/ayunat/main/pai | grep $MYIP | awk '{print $3}')
if [ $MYIP = $MYIP ]; then
echo -e "${NC}${GREEN}ได้รับอนุญาติ...${NC}"
else
echo -e "${NC}${RED}คุณไม่ได้รับสิทธิเข้าใช้งาน!${NC}";
echo -e "${NC}${LIGHT}ติดต่อแอดมิน!!"
echo -e "${NC}${LIGHT}Telegram : https://t.me/yallaaj"
exit 0
fi
clear
NUMBER_OF_CLIENTS=$(grep -E "^### " "/etc/xray/config.json" | sort | uniq | cut -d ' ' -f 2 | wc -l)
	if [[ ${NUMBER_OF_CLIENTS} == '0' ]]; then
		echo ""
		echo "ไม่มีผู้ใช้งาน!"
		exit 1
	fi

	clear
	echo ""
	echo " เลือกชื่อที่ต้องการลบ"
	echo " กด CTRL+C เพื่อกลับไปเมนูหลัก"
	echo  "****************************"
	echo "     ไม่มีผู้ใช้ที่หมดอายุ"
	grep -E "^### " "/etc/xray/config.json" | cut -d ' ' -f 2-3 | sort | uniq | column -t | nl -s ') '
	until [[ ${CLIENT_NUMBER} -ge 1 && ${CLIENT_NUMBER} -le ${NUMBER_OF_CLIENTS} ]]; do
		if [[ ${CLIENT_NUMBER} == '1' ]]; then
			read -rp "โปรดเลือก [1]: " CLIENT_NUMBER
		else
			read -rp "Sโปรดเลือก [1-${NUMBER_OF_CLIENTS}]: " CLIENT_NUMBER
		fi
	done
user=$(grep -E "^### " "/etc/xray/config.json" | sort | uniq | cut -d ' ' -f 2 | sed -n "${CLIENT_NUMBER}"p)
exp=$(grep -E "^### " "/etc/xray/config.json" | sort | uniq | cut -d ' ' -f 3 | sed -n "${CLIENT_NUMBER}"p)
sed -i "/^### $user $exp/,/^},{/d" /etc/xray/config.json
sed -i "/^### $user $exp/,/^},{/d" /etc/xray/config.json
rm -f /etc/xray/vmess-$user-tls.json /etc/xray/vmess-$user-nontls.json
rm -f /home/vps/public_html/ss-ws-${user}.txt
systemctl restart xray.service
clear
echo " "
echo -e "****************************"
echo -e "                        ข้อมูลบัญชี"
echo -e "****************************"
echo "Username  : $user"
echo "Expired   : $exp"
echo -e "****************************"
echo -e "JAVA"
