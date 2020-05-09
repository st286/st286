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



WPS=wps-office_11.1.0.9505.XA_amd64.deb





echo "Install chinese-input, printer, and bluetooth on a new kali linux"
echo "sudo su"


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

systemctle enable cups
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


##Install WPS-linux

if ! [[ -f "$WPS" ]] || prompt "Intsall wps-linux? "; then
    dpkg -i  "$WPS"
    echo "WPS-linux install done."
else
    echo "Skipping Install WPS-linux."
fi


## Install GoldenDict

if ! prompt "Install GoldenDict ? "; then
    apt install goldendict -y
    echo "install done."
    echo "要手動安裝詞庫"
else
    echo "Skipping Install GoldenDict."
fi



echo "reboot"
reboot



