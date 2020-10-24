#!/bin/bash

if [[ $(id -u) != 0 ]]; then
    echo Please run this script as root.
    exit 1
fi



echo "Install gnutls-bin and gnutls-doc "

apt update
apt install gnutls-bin gnutls-doc

echo "Generate template: ca.tmpl and server.tmpl "

cat > ca.tmpl << EOF
cn = "_ip_"
organization = "steven for great fire"
serial = 1
expiration_days = 3650
ca
signing_key
cert_signing_key
crl_signing_key
EOF

cat > server.tmpl << EOF
cn = "_ip_"
organization = "steven for great fire"
expiration_days = 3650
signing_key
encryption_key
tls_www_server
EOF


echo "Add ip to ca.tmpl and server.tmpl"

# Get host ip address
## 生成密钥、证书（IP方式）

ip=$(curl -s http://api.ipify.org)

sed -i "s/_ip_/$ip/" ca.tmpl
sed -i "s/_ip_/$ip/" server.tmpl


#生成 CA密钥\证书,生成服务器证书密钥\证书
if ! [[ -f "ca-key.pem" ]] || prompt "The ca-key.pem already exists, overwrite?"; then
    certtool --generate-privkey --outfile ca-key.pem
    certtool --generate-self-signed --load-privkey ca-key.pem --template ca.tmpl --outfile ca-cert.pem
    certtool --generate-privkey --outfile server-key.pem
    certtool --generate-certificate --load-privkey server-key.pem --load-ca-certificate ca-cert.pem --load-ca-privkey ca-key.pem --template server.tmpl --outfile server-cert.pem
else
    echo Skipping generate ca-key.pem...
fi

chmod 600 ca-key.pem ca-cert.pem server-key.pem server-cert.pem

echo "all done"
