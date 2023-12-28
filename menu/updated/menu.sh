#!/bin/bash
# Information
OK="${GREEN}[OK]${NC}"
Error="${RED}[Mistake]${NC}"

clear
echo -e "────────────────────────────────────────────────────────────"
echo -e "          JJJ   AAAAA  V   V  AAAAA                   "
echo -e "           J    A   A  V   V  A   A                   "
echo -e "           J    AAAAA  V   V  AAAAA                   "
echo -e "        J  J    A   A   V V   A   A                   "
echo -e "         JJ     A   A    V    A   A                   "
echo -e "────────────────────────────────────────────────────────────"
echo -e "            WELCOME TO FREESCRIPT"
echo -e "                 Powered by JAVA"
echo -e ""
echo -e "           [ หน้าหลัก ]       "
echo -e "────────────────────────────────────────────────────────────"
echo -e "1. สร้างบัญชี              "
echo -e "2. รีสตาร์ทบริการทั้งหมด          "
echo -e "3. ตรวจสอบพอร์ต             "
echo -e "4. ตรวจสอบบริการ                 "
echo -e "5. ตั้งค่า                  "
echo -e "6. ออก                        "
echo -e "────────────────────────────────────────────────────────────"
echo -e "หากตรวจเจอปัญหาติดต่อแอดมิน Telegram https://t.me/yallaaj"
echo -e "Copyright JAVA"
read -p "โปรดเลือก [1 - 6] : " menu
echo -e "────────────────────────────────────────────────────────────"
case $menu in
    1)
        maddxray
        ;;
    2)
        restart-xray
        ;;
    3)
        cek-port
        ;;
    4)
        start-menu
        ;;
    5)
        msettings
        ;;
    6)
        clear
        exit
        ;;
    *)
        clear
        menu
        ;;
esac

