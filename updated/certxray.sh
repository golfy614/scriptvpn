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
echo start
sleep 0.5
source /var/lib/akbarstorevpn/ipvps.conf
if [[ "$IP" = "" ]]; then
domain=$(cat /etc/xray/domain)
else
domain=$IP
fi
# Delete Files
rm -f /etc/xray/xray.crt
rm -f /etc/xray/xray.key

systemctl enable xray.service
sudo lsof -t -i tcp:80 -s tcp:listen | sudo xargs kill
cd /root/
curl https://get.acme.sh | sh
bash acme.sh --install
cd .acme.sh
bash acme.sh --set-default-ca --server letsencrypt
bash acme.sh --register-account -m senowahyu62@gmail.com
bash acme.sh --issue --standalone -d $domain--force
bash acme.sh --installcert -d $domain --fullchainpath /etc/xray/xray.crt --keypath /etc/xray/xray.key
sleep 3
restart-xray

