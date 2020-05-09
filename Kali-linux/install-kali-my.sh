#!/bin/bash

set -euo pipefail

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



echo "Install chinese-input, printer, and bluetooth on a new kali linux"



echo "install chinese input method"
echo ""

apt update

apt install -y ibus zenity

echo "configuration"
im-config

apt install -y ibus-rime

echo "reboot then system-config"

echo ""


echo "install printer"

apt install -y  cups cups-client "foomatic-db"

systemctl enable cups
service cups start

echo "printer configuration"
system-config-printer

echo "printer done"

echo ""

echo "install bluetooth"

apt install -y bluetooth
systemctl enable bluetooth
service bluetooth start

echo "bluetooth done"



echo "reboot"
reboot



