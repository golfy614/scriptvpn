#!/bin/bash
if [ "${EUID}" -ne 0 ]; then
		echo "You need to run this script as root"
		exit 1
fi
if [ "$(systemd-detect-virt)" == "openvz" ]; then
		echo "OpenVZ is not supported"
		exit 1
fi
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

echo ' .......................................................... ' 
echo '     ____   ____  __ __   ____  ____     ___  ______        ' 
echo '    |    | /    T|  T  | /    T|    \   /  _]|      T       '  
echo '    l__  |Y  o  ||  |  |Y  o  ||  _  Y /  [_ |      |       ' 
echo '    __j  ||     ||  |  ||     ||  |  |Y    _]l_j  l_j       '
echo '   /  |  ||  _  |l  :  !|  _  ||  |  ||   [_   |  |         '
echo '   \  `  ||  |  | \   / |  |  ||  |  ||     T  |  |         '
echo '    \____jl__j__j  \_/  l__j__jl__j__jl_____j  l__j         '
echo '                      Copyright ©JAVA           '                              
echo ''                                                         
echo '                    ⚡ FREE สคริป ⚡     '
echo ' .......................................................... '
echo '              Auto Installation Script By JAVA              '
echo '                     MiniScript 2023                        '
echo '                     Contact Owner                          '  
echo '                Telegram : @yallaaj                         '
echo '                Tel   : +66934567688                        '    
echo '...........................................................'
echo ''
echo '                     โปรดรอสักครู่..... !                      '
echo ' .......................................................... '
sleep 5
# =========================================
# Getting
MYIP=$(wget -qO- ipinfo.io/ip);
echo "ตรวจสอบวีพีเอส"
IZIN=$(wget -qO- ipinfo.io/ip);
clear
echo '============================================='
echo '                โปรดรอสักครู่... '
echo '       ระบบจะทำการอัพเดทและอัพเกรดเซิฟเวอร์'
echo '============================================='
sleep 5
apt update && apt upgrade -y
clear
echo '============================================='
echo '                 เรียบร้อยแล้ว '
echo '============================================='
sleep 5
clear
echo '============================================='
echo '         ระบบกำลังจะดำเนินการลงสคริปให้กับท่าน '
echo '============================================='
sleep 5
mkdir /var/lib/akbarstorevpn;
mkdir /var/lib/crot;
mkdir /etc/xray;
echo "IP=" >> /var/lib/crot/ipvps.conf
echo "IP=" >> /var/lib/akbarstorevpn/ipvps.conf
cd
#
# Add Domain
wget https://raw.githubusercontent.com/golfy614/scriptvpn/main/updated/adddomain.sh && chmod +x adddomain.sh && ./adddomain.sh
#
echo '============================================='
echo '        กำลังติดตั้ง  Tools '
echo '============================================='
sleep 3
wget https://raw.githubusercontent.com/golfy614/scriptvpn/main/install-tools.sh && chmod +x install-tools.sh && ./install-tools.sh
#
echo '============================================='
echo '        กำลังติดตั้ง XRAY CORE '
echo '============================================='
sleep 3
wget https://raw.githubusercontent.com/golfy614/scriptvpn/main/install-tools.sh && chmod +x install-tools.sh && ./install-tools.sh
#
echo '============================================='
echo '        กำลังติดตั้ง SSH TUNNEL '
echo '============================================='
sleep 3
wget https://raw.githubusercontent.com/golfy614/scriptvpn/main/install-ssh.sh && chmod +x install-ssh.sh && ./install-ssh.sh
echo '============================================='
echo '        กำลังติดตั้ง Menu '
echo '============================================='
sleep 3
wget https://raw.githubusercontent.com/golfy614/scriptvpn/main/menu/updatedll.sh && chmod +x updatedll.sh && ./updatedll.sh
#
#SELESAI
# collor status
error1="${RED} [ERROR] ${NC}"
success="${GREEN} [OK] ${NC}"
# Cek Domain
source /var/lib/akbarstorevpn/ipvps.conf
if [[ "$IP" = "" ]]; then
	clear
    echo -e " ${error1}การติดตั้งล้มเหลว!!"
	rm -rf updatedll
	rm -rf updatedll.sh
	rm -rf setup.sh
	rm -rf install-xray.sh
	rm -rf install-ssh.sh
	rm -rf install-tools.sh
	rm -rf adddomain.sh
	echo " Reboot 15 Sec"
	sleep 15
	reboot
else
	clear
	echo "${success} การติดตั้งสำเร็จ!!"
	sleep 3
	clear
	echo " "
	echo "============================================================================" | tee -a log-install.txt
	echo "" | tee -a log-install.txt
	echo "----------------------------------------------------------------------------" | tee -a log-install.txt
	echo -e "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"  | tee -a log-install.txt
	echo -e "    สคริปมัลติพอร์ต   "  | tee -a log-install.txt
	echo -e "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"  | tee -a log-install.txt
	echo ""  | tee -a log-install.txt
	echo "   >>> บริการ & พอร์ต "  | tee -a log-install.txt
	echo "   - Nginx                      : 89"  | tee -a log-install.txt
	echo "   - SSH TUNNEL                 : 444"  | tee -a log-install.txt
	echo "   - XRAYS TROJAN WS TLS        : 443"  | tee -a log-install.txt
	echo "   - XRAYS SHADOWSOCKS WS TLS   : 443"  | tee -a log-install.txt
	echo "   - XRAYS VLESS WS TLS         : 443"  | tee -a log-install.txt
	echo "   - XRAYS VMESS WS TLS         : 443"  | tee -a log-install.txt
	echo "   - XRAYS TROJAN WS HTTP       : 80"  | tee -a log-install.txt
	echo "   - XRAYS SHADOWSOCKS WS HTTP  : 80"  | tee -a log-install.txt
	echo "   - XRAYS VLESS WS HTTP        : 80"  | tee -a log-install.txt
	echo "   - XRAYS VMESS WS HTTP        : 80"  | tee -a log-install.txt
	echo "   - XRAYS TROJAN GRPC          : 443"  | tee -a log-install.txt
	echo "   - XRAYS SHADOWSOCKS GRPC     : 443"  | tee -a log-install.txt
	echo "   - XRAYS VMESS GRPC           : 443"  | tee -a log-install.txt
	echo "   - XRAYS VLESS GRPC           : 443"  | tee -a log-install.txt
	echo ""  | tee -a log-install.txt
	echo "   >>> ข้อมูลทั่วไป "  | tee -a log-install.txt
	echo "   - Timezone                : Asia/Bangkok (GMT +7)"  | tee -a log-install.txt
	echo "   - Fail2Ban                : [ON]"  | tee -a log-install.txt
	echo "   - Dflate                  : [ON]"  | tee -a log-install.txt
	echo "   - IPtables                : [ON]"  | tee -a log-install.txt
	echo "   - Auto-Reboot             : [ON]"  | tee -a log-install.txt
	echo "   - IPv6                    : [OFF]"  | tee -a log-install.txt
	echo "   - Autoreboot On 05.00 GMT +7" | tee -a log-install.txt
	echo "   - Autobackup Data" | tee -a log-install.txt
	echo "   - Restore Data" | tee -a log-install.txt
	echo "   - Auto Delete Expired Account" | tee -a log-install.txt
	echo "   - Full Orders For Various Services" | tee -a log-install.txt
	echo "   - White Label" | tee -a log-install.txt
	echo "   - Installation Log --> /root/log-install.txt"  | tee -a log-install.txt
	echo " รีบูตภายใน 15 วินาที"
	sleep 15
	cd
	rm -rf updatedll
	rm -rf updatedll.sh
	rm -rf setup.sh
	rm -rf install-xray.sh
	rm -rf install-ssh.sh
	rm -rf install-tools.sh
	rm -rf adddomain.sh
	sleep 1
	reboot
fi
