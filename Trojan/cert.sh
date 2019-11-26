#!/bin/bash

if [[ $(id -u) != 0 ]]; then
    echo Please run this script as root.
    exit 1
fi

echo "Install gnutls-bin and gnutls-doc "

apt install gnutls-bin gnutls-doc

echo "Generate template: ca.tmpl and server.tmpl "


cat > ca.tmpl << EOF
cn = "$(date)"
organization = "$(date)"
serial = 1
expiration_days = 3650
ca
signing_key
cert_signing_key
crl_signing_key
EOF

sleep 2s

cat > server.tmpl << EOF
cn = "$(date)"
organization = "$(date)"
expiration_days = 3650
signing_key
encryption_key
tls_www_server
EOF

echo "生成 CA 密钥"

certtool --generate-privkey --outfile ca-key.pem

echo "生成 CA 证书"

certtool --generate-self-signed --load-privkey ca-key.pem --template ca.tmpl --outfile ca-cert.pem

echo "生成服务器证书密钥"

certtool --generate-privkey --outfile server-key.pem

echo "生成服务器证书"

certtool --generate-certificate --load-privkey server-key.pem --load-ca-certificate ca-cert.pem --load-ca-privkey ca-key.pem --template server.tmpl --outfile server-cert.pem

echo "all done"
