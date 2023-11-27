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
source /var/lib/akbarstorevpn/ipvps.conf
if [[ "$IP" = "" ]]; then
domain=$(cat /etc/xray/domain)
else
domain=$IP
fi
tr="$(cat ~/log-install.txt | grep -w "XRAYS TROJAN WS TLS" | cut -d: -f2|sed 's/ //g')"
until [[ $user =~ ^[a-zA-Z0-9_]+$ && ${user_EXISTS} == '0' ]]; do
		read -rp "ชื่อ : " -e user
		user_EXISTS=$(grep -wE "^#&# ${user}" "/etc/xray/config.json" | sort | uniq | cut -d ' ' -f 2 | wc -l)

		if [[ ${user_EXISTS} -ge '1' ]]; then
			echo ""
			echo -e "กรุณาเปลี่ยนชื่อใหม่ เพราะชื่อนี้ ${RED}${user}${NC} มีอยู่ในระบบระแล้ว"
			exit 1
		fi
	done
read -p "หมดอายุ (จำนวนวัน) : " masaaktif
uuid=$(cat /proc/sys/kernel/random/uuid)
hariini=`date -d "0 days" +"%Y-%m-%d"`
exp=`date -d "$masaaktif days" +"%Y-%m-%d"`
sed -i '/#trojanws$/a\#&# '"$user $exp"'\
},{"password": "'""$uuid""'","email": "'""$user""'"' /etc/xray/config.json
sed -i '/#trojangrpc$/a\#&# '"$user $exp"'\
},{"password": "'""$uuid""'","email": "'""$user""'"' /etc/xray/config.json

systemctl restart xray.service
#buattrojan
trojanlinkgrpc="trojan://${uuid}@${domain}:443?mode=gun&security=tls&type=grpc&serviceName=trojan-grpc&sni=bug.com#${user}"
trojanlinkws="trojan://${uuid}@${domain}:443?path=/xraytrojanws&security=tls&host=bug.com&type=ws&sni=bug.com#${user}"
service cron restart
clear
echo -e ""
echo -e "****************************"
echo -e "                        ข้อมูลบัญชี"
echo -e "****************************"
echo -e "Remarks  : ${user}"
echo -e "IP/Host  : ${MYIP}"
echo -e "Address  : ${domain}"
echo -e "Port     : ${tr}"
echo -e "Key      : ${uuid}"
echo -e "Created  : $hariini"
echo -e "Expired  : $exp"
echo -e "****************************"
echo -e "                        ลิงก์"
echo -e "****************************"
echo -e "Link Trojan WS  : ${trojanlinkws}"
echo -e "****************************"
echo -e "Link Trojan GRPC : ${trojanlinkgrpc}"
echo -e "****************************"
echo -e "JAVA"