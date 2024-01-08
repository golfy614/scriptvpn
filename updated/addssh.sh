#!/bin/bash
cd /etc/stunnel && wget https://raw.githubusercontent.com/golfy614/scriptovpn/main/Install/stunnel.pem && cd $HOME

##############################
IP=$(wget -qO- ipinfo.io/ip)
domain=$(cat /etc/xray/domain)
tput setaf 7;tput setab 4;tput bold;printf '%30s%s%-15s\n' "สร้างแอคเคาท์ SSH+TLS";tput sgr0
echo ""
echo -ne "\033[1;32mชื่อผู้ใช้:\033[1;37m ";read username
[[ -z $username ]] && {
	echo -e "\n${cor1}คุณไม่ได้กรอกชื่อผู้ใช้หรือชื่อนี้ไม่สามารถใช้งานได้!${scor}\n"
	exit 1
}
[[ "$(grep -wc $username /etc/passwd)" != '0' ]] && {
	echo -e "\n${cor1}มีผู้ใช้ชื่อนี้แล้ว กรุณาใช้ชื่ออื่น!${scor}\n"
	exit 1
}
[[ ${username} != ?(+|-)+([a-zA-Z0-9]) ]] && {
	echo -e "\n${cor1}ชื่อผู้ใช้นี้ไม่สามารถใช้งานได้!${scor}"
	echo -e "${cor1}ห้ามมีช่องว่างหรืออักขระพิเศษ!${scor}\n"
	exit 1
}
sizemin=$(echo ${#username})
[[ $sizemin -lt 2 ]] && {
	echo -e "\n${cor1}ชื่อผู้ใช้นี้สั้นเกินไป${scor}"
	echo -e "${cor1}ต้องมีอย่างน้อย 2 ตัวอักษร!${scor}\n"
	exit 1
}
sizemax=$(echo ${#username})
[[ $sizemax -gt 10 ]] && {
	echo -e "\n${cor1}ชื่อผู้ใช้นี้ยาวเกินไป"
	echo -e "${cor1}ตั้งชื่อได้สูงสุด 10 ตัวอักษร!${scor}\n"
	exit 1
}
echo -ne "\033[1;32mรหัสผ่าน:\033[1;37m ";read password
[[ -z $password ]] && {
	echo -e "\n${cor1}คุณไม่ได้ใส่รหัสผ่านหรือรูปแบบไม่ถูกต้อง!${scor}\n"
	exit 1
}
sizepass=$(echo ${#password})
[[ $sizepass -lt 4 ]] && {
	echo -e "\n${cor1}รหัสผ่านสั้นเกินไป ต้องมีอย่างน้อย 4 ตัวอักษร${scor}\n"
	exit 1
}
echo -ne "\033[1;32mกำหนดวันหมดอายุ:\033[1;37m ";read dias
[[ -z $dias ]] && {
	echo -e "\n${cor1}จำนวนวัน!${scor}\n"
	exit 1
}
[[ ${dias} != ?(+|-)+([0-9]) ]] && {
	echo -e "\n${cor1}คุณกรอกจำนวนวันใช้งานไม่ถูกต้อง!${scor}\n"
	exit 1
}
[[ $dias -lt 1 ]] && {
	echo -e "\n${cor1}จำนวนวันใช้งานต้องมากกว่า 0!${scor}\n"
	exit 1
}
echo -ne "\033[1;32จำนวนเครื่องที่เชื่อมต่อได้:\033[1;37m ";read sshlimiter
[[ -z $sshlimiter ]] && {
	echo -e "\n${cor1}คุณยังไม่ได้กำหนดจำนวนการเชื่อมต่อ!${scor}\n"
	exit 1
}
[[ ${sshlimiter} != ?(+|-)+([0-9]) ]] && {
	echo -e "\n${cor1}คุณกรอกจำนวนการเชื่อมต่อไม่ถูกต้อง!${scor}\n"
	exit 1
}
[[ $sshlimiter -lt 1 ]] && {
	echo -e "\n${cor1}จำนวนการเชื่อมต่อต้องมากกว่า 0!${scor}\n"
	exit 1
}
final=$(date "+%Y-%m-%d" -d "+$dias days")
gui=$(date "+%d/%m/%Y" -d "+$dias days")
pass=$(perl -e 'print crypt($ARGV[0], "password")' $password)
useradd -e $final -M -s /bin/false -p $pass $username >/dev/null 2>&1 &
echo "$password" >/etc/SSHPlus/senha/$username
echo "$username $sshlimiter" >>/root/users.db

clear
		echo -e "\E[44;1;37m       สร้างแอคเคาท์ SSH+TLS สำเร็จ!      \E[0m"
		echo -e "\n\033[1;32mไอพี: \033[1;37m$IP"
        echo -e "\033[1;32mโดเมน: \033[1;37m$domain"
		echo -e "\033[1;32mชื่อผู้ใช้: \033[1;37m$username"
		echo -e "\033[1;32mรหัสผ่าน: \033[1;37m$password"
		echo -e "\033[1;32mหมดอายุ: \033[1;37m$gui"
		echo -e "\033[1;32mจำนวนเครื่องที่เชื่อมต่อได้: \033[1;37m$sshlimiter"

#############################

service stunnel4 restart
service ssh restart
/etc/init.d/stunnel4 restart
service stunnel4 restart