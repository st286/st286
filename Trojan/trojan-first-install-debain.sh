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

NAME=trojan
VERSION=1.13.0
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
if ! [[ -f "$CLIENTPATH" ]] || prompt "The server config already exists in $CLIENTPATH, overwrite?"; then
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

cd "$INSTALLPREFIX/etc/$NAME"

echo "Installing gnutls-bin and gnutls-doc "

apt update
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


echo Configuration and keys is in the  "$INSTALLPREFIX/etc/$NAME"
echo All Done!

