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

# 更换.bashrc
forbashrc="IyB+Ly5iYXNocmM6IGV4ZWN1dGVkIGJ5IGJhc2goMSkgZm9yIG5vbi1sb2dpbiBzaGVsbHMuCgojIE5vdGU6IFBTMSBhbmQgdW1hc2sgYXJlIGFscmVhZHkgc2V0IGluIC9ldGMvcHJvZmlsZS4gWW91IHNob3VsZCBub3QKIyBuZWVkIHRoaXMgdW5sZXNzIHlvdSB3YW50IGRpZmZlcmVudCBkZWZhdWx0cyBmb3Igcm9vdC4KIFBTMT0nJHtkZWJpYW5fY2hyb290OisoJGRlYmlhbl9jaHJvb3QpfVxoOlx3XCQgJwogdW1hc2sgMDIyCgojIFlvdSBtYXkgdW5jb21tZW50IHRoZSBmb2xsb3dpbmcgbGluZXMgaWYgeW91IHdhbnQgYGxzJyB0byBiZSBjb2xvcml6ZWQ6CiBleHBvcnQgTFNfT1BUSU9OUz0nLS1jb2xvcj1hdXRvJwogZXZhbCAiYGRpcmNvbG9yc2AiCiBhbGlhcyBscz0nbHMgJExTX09QVElPTlMnCiBhbGlhcyBsbD0nbHMgJExTX09QVElPTlMgLWwnCiBhbGlhcyBsPSdscyAkTFNfT1BUSU9OUyAtbEEnCgojIFNvbWUgbW9yZSBhbGlhcyB0byBhdm9pZCBtYWtpbmcgbWlzdGFrZXM6CiBhbGlhcyBybT0ncm0gLWknCiBhbGlhcyBjcD0nY3AgLWknCiBhbGlhcyBtdj0nbXYgLWknCgojIGVkaXQgYnkgU3Q0c3dpZnQgMzBOb3YyMDE5"
base64 -d <<< ${forbashrc} > for-bashrc

if ! [[ -f ".bashrc" ]] || prompt "The .bashrc already exists, Update?"; then
    mv  .bashrc  .bashrc-old
    cp  for-bashrc .bashrc
    source .bashrc
    echo ".bashrc update... done!"
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

wget https://raw.githubusercontent.com/st286/st286.github.io/master/Trojan/trojan-first-install-debain.sh 
bash trojan-first-install-debain.sh


# 安装v2ray
apt update && apt upgrade -y

wget -O v2ray-install.sh https://install.direct/go.sh
bash v2ray-install.sh

# 更新配置config.json
cd /etc/v2ray/

cat > config-install.json << EOF
{
    "log": {
        "access": "/var/log/v2ray/access.log",
        "error": "/var/log/v2ray/error.log",
        "loglevel": "warning"
    },
    "inbound": {
        "port": 47 ,
        "protocol": "vmess",
        "settings": {
            "clients": [
                {
                 // One:
                    "id": "_passwd1_",
                    "level": 1,
                    "alterId": 64
                },
                {
                 // Two:
                    "id": "_passwd2_",
                    "level": 1,
                    "alterId": 64
                },
		            {
		              // Three: 
                    "id": "_passwd3_",
                    "level": 1,
                    "alterId": 64
                }
            ],
	 "streamSettings": {
	      "network": "tcp"
	  },
            "detour": {
                "to": "mydetour"
            }
        }
    },
    "inbounddetour": [
        {
            "protocol": "vmess",
            "port": "20000-50000",
            "tag": "mydetour",
            "settings": {
                "default": {
                    "level": 1,
                    "alterid": 32
                }
            },
            "allocate": {
                "strategy": "random",
                "concurrency": 2,
                "refresh": 3
            }
        },
        {
            "protocol": "shadowsocks",
            "port": 225,
            "settings": {
                "method": "aes-256-gcm",
                "password": "_passwd4_"
            }
        }
    ],
    "outbounds": [{
      "protocol": "freedom",
        "settings": {
  	  "domainStrategy": "AsIs",
  	  "userLevel": 0
        }
    },{
      "protocol": "blackhole",
      "settings": {},
      "tag": "blocked"
    }],
    "routing": {
      "rules": [
        {
          "type": "field",
          "ip": ["geoip:private"],
          "outboundTag": "blocked"
        }
      ]
    }
}
EOF

pswd1=$(cat /proc/sys/kernel/random/uuid)
pswd2=$(cat /proc/sys/kernel/random/uuid)
pswd3=$(cat /proc/sys/kernel/random/uuid)
pswd4=$(cat /proc/sys/kernel/random/uuid)

sed -i "s/_passwd1_/$pswd1/;s/_passwd2_/$pswd2/;s/_passwd3_/$pswd3/;s/_passwd4_/$pswd4/" config-install.json

if ! [[ -f "config.json" ]] || prompt "The V2ray config.json already exists, Update?"; then
    mv config.json config-old.json
    cp config-install.json config.json
else
    echo Skipping Update V2ray config.json
fi

cd 

service v2ray start

echo " "
echo "Installed  Trojan, V2ray, and Nginx now!"
echo "Trojan  configuration  in   /usr/local/etc/trojan/"
echo "V2ray   configuration  in   /etc/v2ray/"
echo "Nginx   config...      in   /var/www/html/"
echo " "
echo All Done!


