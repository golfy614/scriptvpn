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
tls="$(cat ~/log-install.txt | grep -w "VMESS WS TLS" | cut -d: -f2|sed 's/ //g')"
none="$(cat ~/log-install.txt | grep -w "VMESS WS HTTP" | cut -d: -f2|sed 's/ //g')"
echo -e ""
echo -e "************************************************************"
echo -e "******************* WELCOME TO JAVANET *********************"
echo -e "****************** Auto Scrip By jAvaNet *******************"
echo -e "**LINE:javanet**** Whatsapp:+66934567688 *****FB:javajaja***"
echo -e "************************************************************"
echo -e ""
echo -e "************************************************************"
echo -e "              แก้ไขพอร์ต"
echo -e "************************************************************"
echo -e "[1].       แก้ไขพอร์ต Vmess TLS $tls"
echo -e "[2].       แก้ไขพอร์ต Vmess None TLS $none"
echo -e "[3].       กลับไปยังเมนูหลัก"
echo -e "************************************************************"
echo -e ""
read -p "โปรดเลือก  [ 1-3 ] : " prot
echo -e ""
case $prot in
1)
read -p "พอร์ตใหม่ Vmess TLS : " tls1
if [ -z $tls1 ]; then
echo "กรุณาใส่พอร์ท"
exit 0
fi
cek=$(netstat -nutlp | grep -w $tls1)
if [[ -z $cek ]]; then
# sed -i "s/$tls/$tls1/g" /etc/xray/config.json
sed -i "s/$tls/$tls1/g" /etc/nginx/conf.d/xray.conf
sed -i "s/   - XRAYS TROJAN WS TLS        : $tls/   - XRAYS TROJAN WS TLS        : $tls1/g" /root/install-log.txt
sed -i "s/   - XRAYS SHADOWSOCKS WS TLS   : $tls/   - XRAYS SHADOWSOCKS WS TLS   : $tls1/g" /root/install-log.txt
sed -i "s/   - XRAYS VLESS WS TLS         : $tls/   - XRAYS VLESS WS TLS         : $tls1/g" /root/install-log.txt
sed -i "s/   - XRAYS VMESS WS TLS         : $tls/   - XRAYS VMESS WS TLS         : $tls1/g" /root/install-log.txt
sed -i "s/   - XRAYS TROJAN GRPC          : $tls/   - XRAYS TROJAN WS GRPC       : $tls1/g" /root/install-log.txt
sed -i "s/   - XRAYS SHADOWSOCKS GRPC     : $tls/   - XRAYS SHADOWSOCKS GRPC     : $tls1/g" /root/install-log.txt 
sed -i "s/   - XRAYS VMESS GRPC           : $tls/   - XRAYS VMESS GRPC           : $tls1/g" /root/install-log.txt
sed -i "s/   - XRAYS VLESS GRPC           : $tls/   - XRAYS VLESS GRPC           : $tls1/g" /root/install-log.txt
iptables -D INPUT -m state --state NEW -m tcp -p tcp --dport $tls -j ACCEPT
iptables -D INPUT -m state --state NEW -m udp -p udp --dport $tls -j ACCEPT
iptables -I INPUT -m state --state NEW -m tcp -p tcp --dport $tls1 -j ACCEPT
iptables -I INPUT -m state --state NEW -m udp -p udp --dport $tls1 -j ACCEPT
iptables-save > /etc/iptables.up.rules
iptables-restore -t < /etc/iptables.up.rules
netfilter-persistent save > /dev/null
netfilter-persistent reload > /dev/null
systemctl restart xray.service > /dev/null
echo -e "\e[032;1mเปลี่ยนพอร์ตสำเร็จแล้ว พอร์ตใหม่คือ  $tls1 \e[0m"
else
echo "$tls1 พอร์ตนี้ถูกใช้งานแล้ว"
fi
;;
2)
echo "กรุณาใส่สองเลขเท่านั้น (เช่น : 69)"
read -p "พอร์ตใหม่ None TLS : " none1
if [ -z $none1 ]; then
echo "กรุณาใส่พอร์ท"
exit 0
fi
cek=$(netstat -nutlp | grep -w $none1)
if [[ -z $cek ]]; then
sed -i "s/$none/$none1/g" /etc/nginx/conf.d/xray.conf
# sed -i "s/$none/$none1/g" /etc/xray/config.json
sed -i "s/   - XRAYS TROJAN WS HTTP       : $none/   - XRAYS TROJAN WS HTTP       : $none1/g" /root/log-install.txt
sed -i "s/   - XRAYS SHADOWSOCKS WS HTTP  : $none/   - XRAYS SHADOWSOCKS WS HTTP  : $none1/g" /root/log-install.txt
sed -i "s/   - XRAYS VLESS WS HTTP        : $none/   - XRAYS VLESS WS HTTP        : $none1/g" /root/log-install.txt
sed -i "s/   - XRAYS VMESS WS HTTP        : $none/   - XRAYS VMESS WS HTTP        : $none1/g" /root/log-install.txt
iptables -D INPUT -m state --state NEW -m tcp -p tcp --dport $none -j ACCEPT
iptables -D INPUT -m state --state NEW -m udp -p udp --dport $none -j ACCEPT
iptables -I INPUT -m state --state NEW -m tcp -p tcp --dport $none1 -j ACCEPT
iptables -I INPUT -m state --state NEW -m udp -p udp --dport $none1 -j ACCEPT
iptables-save > /etc/iptables.up.rules
iptables-restore -t < /etc/iptables.up.rules
netfilter-persistent save > /dev/null
netfilter-persistent reload > /dev/null
systemctl restart xray.service > /dev/null
echo -e "\e[032;1mเปลี่ยนพอร์ตสำเร็จแล้ว พอร์ตใหม่คือ  $none1\e[0m"
else
echo "$none1พอร์ตนี้ถูกใช้งานแล้ว"
fi
;;
3)
exit
menu
;;
*)
echo "กรุณาเลือกตัวเลือกให้ถูกต้อง"
;;
esac
