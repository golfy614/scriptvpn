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
# =========================================
# Getting
#
cd
# collor status
error1="${RED} [ERROR] ${NC}"
success="${GREEN} [OK] ${NC}"
# Cek Domain
source /var/lib/akbarstorevpn/ipvps.conf
if [[ "$IP" = "" ]]; then
    clear
    echo -e " ${error1}การติดตั้งล้มเหลว.."
    sleep 2
    exit 0
else
    clear
    echo -e "${success}การติดตั้งสำเร็จ..."
    sleep 2
fi
# ==========================================
# link hosting kalian
aj="https://raw.githubusercontent.com/golfy614/scriptvpn/main/menu"
java="https://raw.githubusercontent.com/golfy614/scriptvpn/main/menu/updated"
javaa="https://raw.githubusercontent.com/golfy614/scriptvpn/main/updated"
cd
rm -r updatedll
wget -O updatedll "https://raw.githubusercontent.com/golfy614/scriptvpn/main/menu/updatedll.sh"
rm -rf updatedll

# hapus
cd /usr/bin
rm -rf xmenu
rm -rf updatedll
rm -r updatedll
# download
#
cd /usr/bin
# update by SL
wget -O xmenu "https://raw.githubusercontent.com/golfy614/scriptvpn/main/menu/xmenu.sh"
wget -O add-akun "https://raw.githubusercontent.com/golfy614/scriptvpn/main/menu/add-akun.sh"
wget -O updatedll "https://raw.githubusercontent.com/golfy614/scriptvpn/main/menu/updatedll.sh"
wget -O add-akun "https://raw.githubusercontent.com/golfy614/scriptvpn/main/menu/add-akun.sh"
wget -O delete-akun "https://raw.githubusercontent.com/golfy614/scriptvpn/main/menu/delete-akun.sh"
wget -O certv2ray "https://raw.githubusercontent.com/fisabiliyusri/Mantap/main/xray/certv2ray.sh"
wget -O restart-xray "https://raw.githubusercontent.com/golfy614/scriptvpn/main/menu/restart-xray.sh"
wget -O xmenu "https://raw.githubusercontent.com/golfy614/scriptvpn/main/menu/xmenu.sh"
wget -O auto-pointing "https://raw.githubusercontent.com/golfy614/scriptvpn/main/menu/auto-pointing.sh"
wget -O cek-port "https://raw.githubusercontent.com/golfy614/scriptvpn/main/menu/cek-port.sh"
wget -O xmenu "https://raw.githubusercontent.com/golfy614/scriptvpn/main/menu/xmenu.sh"
# Update menu
wget -O menu "${java}/menu.sh"
wget -O msettings "${java}/msetting.sh"
wget -O maddxray "${java}/maddxray.sh"
wget -O maddssh "${java}/maddssh.sh"
wget -O start-menu "${java}/start-menu.sh"
# update menu
wget -O addssh "${javaa}/addssh.sh"
wget -O addvmess "${javaa}/addvmess.sh"
wget -O dellvmess "${javaa}/dellvmess.sh"
wget -O rennewvmess "${javaa}/rennewvmess.sh"
wget -O addvless "${javaa}/addvless.sh"
wget -O dellvless "${javaa}/dellvless.sh"
wget -O rennewvless "${javaa}/rennewvless.sh"
wget -O addtrojan "${javaa}/addtrojan.sh"
wget -O delltrojan "${javaa}/delltrojan.sh"
wget -O rennewtrojan "${javaa}/rennewtrojan.sh"
wget -O addss "${javaa}/addss.sh"
wget -O dellss "${javaa}/dellss.sh"
wget -O rennewss "${javaa}/rennewss.sh"
wget -O adddomain "${javaa}/adddomain.sh"
wget -O chngedomain "${javaa}/chngedomain.sh"
wget -O chngeport "${javaa}/chngeport.sh"
wget -O certxray "${javaa}/certxray.sh"
wget -O xp "${javaa}/xp.sh"

#
chmod +x /usr/bin/updatedll
chmod +x /usr/bin/xmenu
chmod +x xmenu
chmod +x add-akun
chmod +x delete-akun
chmod +x updatedll
chmod +x add-akun
chmod +x certv2ray
chmod +x restart-xray
chmod +x auto-pointing
chmod +x cek-port
# update menu
chmod +x msettings
chmod +x maddxray
chmod +x maddssh
chmod +x start-menu
chmod +x menu
# update xray menu
chmod +x addssh
chmod +x addvmess
chmod +x dellvmess
chmod +x rennewvmess
chmod +x addvless
chmod +x dellvless
chmod +x rennewvless
chmod +x addtrojan
chmod +x delltrojan
chmod +x rennewtrojan
chmod +x addss
chmod +x dellss
chmod +x rennewss
chmod +x certxray
chmod +x adddomain
chmod +x chngedomain
chmod +x chngeport
chmod +x xp

clear
echo -e "อัปเดทเรียบร้อยแล้ว..."
cd
