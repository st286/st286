#!/bin/bash
set -euo pipefail

# Code by St4swift, 30Nov2019

if [[ $(id -u) != 0 ]]; then
    echo Please run this script as root.
    exit 1
fi

function prompt() {
    while true; do
        read -p "$1 [y/N] " yn
        case $yn in
            [Yy] ) return 0;;
            [Nn]|"" ) return 1;;
        esac
    done
}

if prompt "This script will install Trojan, V2ray, Nginx, and replace .bashrc, continue installing ???"; then
	echo "Continue Installing..."
else
	echo "Exit!"
	exit 1
fi


# 更换.bashrc
forbashrc="IyB+Ly5iYXNocmM6IGV4ZWN1dGVkIGJ5IGJhc2goMSkgZm9yIG5vbi1sb2dpbiBzaGVsbHMuCgojIE5vdGU6IFBTMSBhbmQgdW1hc2sgYXJlIGFscmVhZHkgc2V0IGluIC9ldGMvcHJvZmlsZS4gWW91IHNob3VsZCBub3QKIyBuZWVkIHRoaXMgdW5sZXNzIHlvdSB3YW50IGRpZmZlcmVudCBkZWZhdWx0cyBmb3Igcm9vdC4KIFBTMT0nJHtkZWJpYW5fY2hyb290OisoJGRlYmlhbl9jaHJvb3QpfVxoOlx3XCQgJwogdW1hc2sgMDIyCgojIFlvdSBtYXkgdW5jb21tZW50IHRoZSBmb2xsb3dpbmcgbGluZXMgaWYgeW91IHdhbnQgYGxzJyB0byBiZSBjb2xvcml6ZWQ6CiBleHBvcnQgTFNfT1BUSU9OUz0nLS1jb2xvcj1hdXRvJwogZXZhbCAiYGRpcmNvbG9yc2AiCiBhbGlhcyBscz0nbHMgJExTX09QVElPTlMnCiBhbGlhcyBsbD0nbHMgJExTX09QVElPTlMgLWwnCiBhbGlhcyBsPSdscyAkTFNfT1BUSU9OUyAtbEEnCgojIFNvbWUgbW9yZSBhbGlhcyB0byBhdm9pZCBtYWtpbmcgbWlzdGFrZXM6CiBhbGlhcyBybT0ncm0gLWknCiBhbGlhcyBjcD0nY3AgLWknCiBhbGlhcyBtdj0nbXYgLWknCgojIGVkaXQgYnkgU3Q0c3dpZnQgMzBOb3YyMDE5"
base64 -d <<< ${forbashrc} > for-bashrc

if ! [[ -f ".bashrc" ]] || prompt "The .bashrc already exists, Update?"; then
    mv  .bashrc  .bashrc-old
    cp  for-bashrc .bashrc
    source .bashrc
    echo ".bashrc update... done! The old .bashrc is .bashrc-old now."
else
    echo "Skipping Update .bashrc"
fi



# 更新package,并安装一些工具
apt update && apt upgrade -y
apt install curl wget htop nload lsof

# 安装nginx,用于trojan
apt update
apt install nginx

# 安装trojan

wget -O trojan-first-install-debain.sh  https://raw.githubusercontent.com/st286/st286.github.io/master/Trojan/trojan-first-install-debain.sh 
bash trojan-first-install-debain.sh


# 安装v2ray

wget -O v2ray-first-install.sh  https://raw.githubusercontent.com/st286/st286.github.io/master/V2ray/v2ray-first-install.sh
bash v2ray-first-install.sh



echo " "
echo "Installed  Trojan, V2ray, and Nginx now!"
echo "Trojan  configuration  in   /usr/local/etc/trojan/"
echo "V2ray   configuration  in   /etc/v2ray/"
echo "Nginx   config...      in   /var/www/html/"
echo " "
echo All Done!



