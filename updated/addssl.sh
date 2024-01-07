#!/bin/bash
cd /etc/stunnel && wget https://raw.githubusercontent.com/golfy614/scriptovpn/main/Install/stunnel.pem && cd $HOME

##############################
IP=$(cat /etc/IP)
tput setaf 7;tput setab 4;tput bold;printf '%30s%s%-15s\n' "Create SSH User";tput sgr0
echo ""
echo -ne "\033[1;32mUsername:\033[1;37m ";read username
[[ -z $username ]] && {
	echo -e "\n${cor1}Empty or invalid username!${scor}\n"
	exit 1
}
[[ "$(grep -wc $username /etc/passwd)" != '0' ]] && {
	echo -e "\n${cor1}This user already exists. try another name!${scor}\n"
	exit 1
}
[[ ${username} != ?(+|-)+([a-zA-Z0-9]) ]] && {
	echo -e "\n${cor1}You entered an invalid username!${scor}"
	echo -e "${cor1}Do not use spaces, accents or special characters!${scor}\n"
	exit 1
}
sizemin=$(echo ${#username})
[[ $sizemin -lt 2 ]] && {
	echo -e "\n${cor1}You entered a very short username${scor}"
	echo -e "${cor1}use at least two characters!${scor}\n"
	exit 1
}
sizemax=$(echo ${#username})
[[ $sizemax -gt 10 ]] && {
	echo -e "\n${cor1}You entered a very long username"
	echo -e "${cor1}use a maximum of 10 characters!${scor}\n"
	exit 1
}
echo -ne "\033[1;32mPassword:\033[1;37m ";read password
[[ -z $password ]] && {
	echo -e "\n${cor1}Password empty or invalid!${scor}\n"
	exit 1
}
sizepass=$(echo ${#password})
[[ $sizepass -lt 4 ]] && {
	echo -e "\n${cor1}Short password !, use at least 4 characters${scor}\n"
	exit 1
}
echo -ne "\033[1;32mDays to expire:\033[1;37m ";read dias
[[ -z $dias ]] && {
	echo -e "\n${cor1}No number of days!${scor}\n"
	exit 1
}
[[ ${dias} != ?(+|-)+([0-9]) ]] && {
	echo -e "\n${cor1}You entered an invalid number of days!${scor}\n"
	exit 1
}
[[ $dias -lt 1 ]] && {
	echo -e "\n${cor1}The number must be greater than zero!${scor}\n"
	exit 1
}
echo -ne "\033[1;32mConnection limit:\033[1;37m ";read sshlimiter
[[ -z $sshlimiter ]] && {
	echo -e "\n${cor1}You left the connection limit empty!${scor}\n"
	exit 1
}
[[ ${sshlimiter} != ?(+|-)+([0-9]) ]] && {
	echo -e "\n${cor1}You entered an invalid number of connection!${scor}\n"
	exit 1
}
[[ $sshlimiter -lt 1 ]] && {
	echo -e "\n${cor1}Number of simultaneous connections must be greater than zero!${scor}\n"
	exit 1
}
final=$(date "+%Y-%m-%d" -d "+$dias days")
gui=$(date "+%d/%m/%Y" -d "+$dias days")
pass=$(perl -e 'print crypt($ARGV[0], "password")' $password)
useradd -e $final -M -s /bin/false -p $pass $username >/dev/null 2>&1 &
echo "$password" >/etc/SSHPlus/senha/$username
echo "$username $sshlimiter" >>/root/users.db

clear
		echo -e "\E[44;1;37m       SSH ACCOUNT CREATED !      \E[0m"
		echo -e "\n\033[1;32mIP: \033[1;37m$IP"
		echo -e "\033[1;32mUser: \033[1;37m$username"
		echo -e "\033[1;32mPassword: \033[1;37m$password"
		echo -e "\033[1;32mExpires in: \033[1;37m$gui"
		echo -e "\033[1;32mConnection limit: \033[1;37m$sshlimiter"

#############################

service stunnel4 restart
service ssh restart
/etc/init.d/stunnel4 restart
service stunnel4 restart