#!/bin/bash
red='\e[1;31m'
green='\e[0;32m'
NC='\e[0m'
MYIP=$(wget -qO- ifconfig.co);
echo "Autoscript By Vinstechmy"
echo ""
echo start
sleep 0.5
source /var/lib/premium-script/ipvps.conf
domain=$IP
systemctl stop xray-mini@vless-direct
systemctl stop xray-mini@vless-splice
systemctl disable xray-mini@vless-direct
systemctl disable xray-mini@vless-splice
systemctl stop v2ray
systemctl stop v2ray@none
systemctl stop v2ray@vless
systemctl stop v2ray@vnone
systemctl stop trojan
sudo lsof -t -i tcp:80 -s tcp:listen | sudo xargs kill
cd /root/
wget -O acme.sh https://raw.githubusercontent.com/acmesh-official/acme.sh/master/acme.sh
bash acme.sh --install
rm acme.sh
cd .acme.sh
bash acme.sh --register-account -m senowahyu62@gmail.com
bash acme.sh --issue --standalone -d $domain --force
bash acme.sh --installcert -d $domain --
fullchainpath /etc/v2ray/v2ray.crt --keypath /etc/v2ray/v2ray.key
systemctl enable xray-mini@vless-direct
systemctl enable xray-mini@vless-splice
systemctl start xray-mini@vless-direct
systemctl start xray-mini@vless-splice
systemctl restart xray-mini@vless-direct
systemctl restart xray-mini@vless-splice
systemctl start v2ray
systemctl start v2ray@none
systemctl start v2ray@vless
systemctl start v2ray@vnone
systemctl start trojan
echo Done
sleep 0.5
clear 
neofetch