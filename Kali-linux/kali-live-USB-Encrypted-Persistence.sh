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



DEV=/dev/sdb

DEVN=/dev/sdb3

KALIISO=kali-linux-2020-W20-live-amd64.iso

USBEND=30gb



echo $DEV
echo $DEVN
echo $KALIISO
echo $USBEND
prompt "Go on ?"


echo "dd kali live ISO, waiting......"
dd if=$KALIISO of=$DEV bs=4M

echo "parted.....waiting..."
read start _ < <(du -bcm $KALIISO | tail -1)

parted $DEV mkpart primary $start $USBEND


echo "Encrypt the partition with LUKS:"

cryptsetup --verbose --verify-passphrase luksFormat $DEVN



echo "Open the encrypted partition:"

cryptsetup luksOpen $DEVN my_usb

echo "Create an ext3 filesystem and label it."

mkfs.ext3 /dev/mapper/my_usb
e2label /dev/mapper/my_usb persistence

echo "Mount the partition and create your persistence.conf so changes persist across reboots:"

mkdir -p /mnt/my_usb
mount /dev/mapper/my_usb /mnt/my_usb
echo "/ union" > /mnt/my_usb/persistence.conf
umount /dev/mapper/my_usb

cryptsetup luksClose /dev/mapper/my_usb


echo "Now your USB stick is ready to plug in and reboot into Live USB Encrypted Persistence mode."


