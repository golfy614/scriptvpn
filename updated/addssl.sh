#!/bin/bash
cd /etc/stunnel && wget https://raw.githubusercontent.com/golfy614/scriptovpn/main/Install/stunnel.pem && cd $HOME
service stunnel4 restart
service ssh restart
/etc/init.d/stunnel4 restart
service stunnel4 restart