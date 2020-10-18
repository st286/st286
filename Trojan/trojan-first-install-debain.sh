#!/bin/bash
set -euo pipefail

function prompt() {
    while true; do
        read -p "$1 [y/N] " yn
        case $yn in
            [Yy] ) return 0;;
            [Nn]|"" ) return 1;;
        esac
    done
}

if [[ $(id -u) != 0 ]]; then
    echo Please run this script as root.
    exit 1
fi


if prompt "This script will install Trojan, continue installing ???"; then
	echo "Trojan Installing..."
else
	echo "Exit!"
	exit 1
fi

NAME=trojan
VERSION=1.16.0
TARBALL="$NAME-$VERSION-linux-amd64.tar.xz"
DOWNLOADURL="https://github.com/trojan-gfw/$NAME/releases/download/v$VERSION/$TARBALL"
TMPDIR="$(mktemp -d)"
INSTALLPREFIX=/usr/local
SYSTEMDPREFIX=/etc/systemd/system

BINARYPATH="$INSTALLPREFIX/bin/$NAME"
CONFIGPATH="$INSTALLPREFIX/etc/$NAME/config.json"
CLIENTPATH="$INSTALLPREFIX/etc/$NAME/client.json"
SYSTEMDPATH="$SYSTEMDPREFIX/$NAME.service"

echo Entering temp directory $TMPDIR...
cd "$TMPDIR"

echo Downloading $NAME $VERSION...
curl -LO "$DOWNLOADURL" || wget "$DOWNLOADURL"

echo Unpacking $NAME $VERSION...
tar xf "$TARBALL"
cd "$NAME"

echo Installing $NAME $VERSION to $BINARYPATH...
install -Dm755 "$NAME" "$BINARYPATH"

echo Installing $NAME server config to $CONFIGPATH...
if ! [[ -f "$CONFIGPATH" ]] || prompt "The server config already exists in $CONFIGPATH, overwrite?"; then
    install -Dm644 examples/server.json-example "$CONFIGPATH"
else
    echo Skipping installing $NAME server config...
fi

echo Installing $NAME client config to $CLIENTPATH...
if ! [[ -f "$CLIENTPATH" ]] || prompt "The client config already exists in $CLIENTPATH, overwrite?"; then
    install -Dm644 examples/client.json-example "$CLIENTPATH"
else
    echo Skipping installing $NAME client config...
fi


if [[ -d "$SYSTEMDPREFIX" ]]; then
    echo Installing $NAME systemd service to $SYSTEMDPATH...
    if ! [[ -f "$SYSTEMDPATH" ]] || prompt "The systemd service already exists in $SYSTEMDPATH, overwrite?"; then
        cat > "$SYSTEMDPATH" << EOF
[Unit]
Description=$NAME
Documentation=https://trojan-gfw.github.io/$NAME/config https://trojan-gfw.github.io/$NAME/
After=network.target network-online.target nss-lookup.target mysql.service mariadb.service mysqld.service

[Service]
Type=simple
StandardError=journal
ExecStart="$BINARYPATH" "$CONFIGPATH"
ExecReload=/bin/kill -HUP \$MAINPID

[Install]
WantedBy=multi-user.target
EOF

        echo Reloading systemd daemon...
        systemctl daemon-reload
    else
        echo Skipping installing $NAME systemd service...
    fi
fi

echo Deleting temp directory $TMPDIR...
rm -rf "$TMPDIR"

##==============================
echo Entering the directory "$INSTALLPREFIX/etc/$NAME"
cd "$INSTALLPREFIX/etc/$NAME"

echo "Install gnutls-bin and gnutls-doc curl"

apt update
apt install gnutls-bin gnutls-doc curl

echo "Generate template files: ca.tmpl and server.tmpl "

cat > ca.tmpl << EOF
cn = "_ip_"
organization = "st4swift.io"
serial = 1
expiration_days = 3650
ca
signing_key
cert_signing_key
crl_signing_key
EOF

cat > server.tmpl << EOF
cn = "_ip_"
organization = "st4swift.io"
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
    chmod 600 ca-key.pem ca-cert.pem server-key.pem server-cert.pem
else
    echo Skipping generate ca-key.pem...
fi


#Generate server and client configuration files

pswd1=$(cat /proc/sys/kernel/random/uuid)
pswd2=$(cat /proc/sys/kernel/random/uuid)

## 将password、服务器证书、密钥，设置入config.json (服务器端)
echo Update $NAME server config.json to $INSTALLPREFIX/etc/$NAME...
if ! [[ -f "$CONFIGPATH" ]] || prompt "The server config already exists in $CONFIGPATH, UPDATE?"; then
    sed -i "s/password1/$pswd1/;s/password2/$pswd2/;s#/path/to/certificate.crt#$INSTALLPREFIX/etc/$NAME/server-cert.pem#;s#/path/to/private.key#$INSTALLPREFIX/etc/$NAME/server-key.pem#" config.json
else
    echo Skipping UPDATE $NAME server config...
fi

## 将IP、password，设置入client.json (客户端)
echo Update $NAME client.json to $INSTALLPREFIX/etc/$NAME...
if ! [[ -f "$CLIENTPATH" ]] || prompt "The client config already exists in $CLIENTPATH, UPDATE?"; then
    sed -i "s/example.com/$ip/;s/password1/$pswd1/" client.json
else
    echo Skipping UPDATE $NAME client config...
fi


##启动trojan, 设置开机启动

systemctl enable trojan
systemctl start trojan
echo ""
echo "Trojan running..."

echo ""
echo Configuration and keys is in the  "$INSTALLPREFIX/etc/$NAME"
echo ""
echo Server config.json:
cat config.json
echo ""
echo Client client.json:
cat client.json

echo ""

systemctl status trojan

echo ""
echo Oct,2020 by St4swift.

echo "Trojan installed!"

