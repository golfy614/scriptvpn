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
		clear
		echo ""
		echo "ไม่มีผู้ใช้งาน!"
		exit 1
	fi

	clear
	echo ""
	echo " เลือกชื่อที่ต้องการต่ออายุ"
	echo " กด CTRL+C เพื่อกลับไปเมนูหลัก"
	echo -e "****************************"
	grep -E "^### " "/etc/xray/config.json" | cut -d ' ' -f 2-3 | sort | uniq | column -t | nl -s ') '
	until [[ ${CLIENT_NUMBER} -ge 1 && ${CLIENT_NUMBER} -le ${NUMBER_OF_CLIENTS} ]]; do
		if [[ ${CLIENT_NUMBER} == '1' ]]; then
			read -rp "โปรดเลือก [1]: " CLIENT_NUMBER
		else
			read -rp "โปรดเลือก [1-${NUMBER_OF_CLIENTS}]: " CLIENT_NUMBER
		fi
	done

user=$(grep -E "^### " "/etc/xray/config.json" | sort | uniq | cut -d ' ' -f 2 | sed -n "${CLIENT_NUMBER}"p)
exp=$(grep -E "^### " "/etc/xray/config.json" | sort | uniq | cut -d ' ' -f 3 | sed -n "${CLIENT_NUMBER}"p)

clear
echo -e ""
echo -e "****************************"
echo -e "                        ข้อมูลบัญชี"
echo -e "****************************"
echo -e "${CLAY}Username : $user "
echo -e "Expired  : $exp ${NC}"
echo -e "****************************"
read -p "ต่ออายุ (จำนวนวัน): " masaaktif
echo -e "กรุณารอสักครู่....."
sleep 3
now=$(date +%Y-%m-%d)
d1=$(date -d "$exp" +%s)
d2=$(date -d "$now" +%s)
exp2=$(( (d1 - d2) / 86400 ))
exp3=$(($exp2 + $masaaktif))
exp4=`date -d "$exp3 days" +"%Y-%m-%d"`
sed -i "s/### $user $exp/### $user $exp4/g" /etc/xray/config.json
sed -i "s/### $user $exp/### $user $exp4/g" /etc/xray/config.json
systemctl restart xray.service
service cron restart
clear
echo ""
echo "****************************"
echo "                        ข้อมูลบัญชี"
echo "****************************"
echo "Username  : $user"
echo "Expired   : $exp4"
echo "****************************"
echo "JAVA"