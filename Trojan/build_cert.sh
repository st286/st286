#!/bin/bash

## 生成自签发（用自身IP）SSL证书
sudo apt-get install gnutls-bin -y
if [ ! -d "~/certs" ]; then
  mkdir ~/certs
fi
cd ~/certs
# 获取本地ip
MYIP=`curl -s  ipinfo.io/ip`
# 生成ca模版
echo -e "cn = \"${USER}\"\norganization = \"${USER}\"\nserial = 1\nexpiration_days = 3650\nca\nsigning_key\ncert_signing_key\ncrl_signing_key" > ca.tmpl
# 生成服务器证书模版
echo -e "cn = \"${MYIP}\"\norganization = \"${USER}\"\nexpiration_days = 3650\nsigning_key\nencryption_key\ntls_www_server" > server.tmpl
# 生成客户端证书模版
echo -e "cn = \"${USER}client\"\nunit = \"${USER}clientunit\"\nexpiration_days = 3650\nsigning_key\ntls_www_client" > user.tmpl
# 生成ca密钥
certtool --generate-privkey --outfile ca-key.pem
# 生成CA证书
certtool --generate-self-signed --load-privkey ca-key.pem --template ca.tmpl --outfile ca-cert.pem
# 生成服务器证书密钥
certtool --generate-privkey --outfile server-key.pem
# 生成服务器证书密钥
certtool --generate-certificate --load-privkey server-key.pem --load-ca-certificate ca-cert.pem --load-ca-privkey ca-key.pem --template server.tmpl --outfile server-cert.pem
# 生成客户端证书密钥
certtool --generate-privkey --outfile user-key.pem
# 生成客户端证书
certtool --generate-certificate --load-privkey user-key.pem --load-ca-certificate ca-cert.pem --load-ca-privkey ca-key.pem --template user.tmpl --outfile user-cert.pem


# 将客户端证书导出成p12格式
certtool --to-p12 --load-privkey user-key.pem --pkcs-cipher 3des-pkcs12 --load-certificate user-cert.pem --outfile user.p12 --outder
