#!/bin/bash

## 编译Lean的Openwrt固件全攻略   https://imgki.com/archives/openwrt-lean.html
## Lean's OpenWrt source    https://github.com/coolsnowwolf/lede

## 用VPS 40G 2CPU 4G，Ubuntu 18.04
## Vultr

## 不要用 root 用户 git 和编译
## 国内用户编译前最好准备好梯子
## 默认登陆IP 192.168.1.1, 密码 password


USER_NAME=st

if [[ $(id -u) != 0 ]]; then
    echo Please run this script as root.
    exit 1
fi


##创建用户
useradd -m $USER_NAME -d /home/$USER_NAME -s /bin/bash

passwd $USER_NAME

echo "visudo /etc/sudoers: add $USER_NAME    ALL=(ALL:ALL) ALL"

visudo


## 转换非root用户
su $USER_NAME



sudo apt-get update

sudo apt-get -y install build-essential asciidoc binutils bzip2 gawk gettext git libncurses5-dev libz-dev patch unzip zlib1g-dev lib32gcc1 libc6-dev-i386 subversion flex uglifyjs git-core gcc-multilib p7zip p7zip-full msmtp libssl-dev texinfo libglib2.0-dev xmlto qemu-utils upx libelf-dev autoconf automake libtool autopoint device-tree-compiler

sudo apt-get -y install build-essential asciidoc binutils bzip2 gawk gettext git libncurses5-dev libz-dev patch unzip zlib1g-dev lib32gcc1 libc6-dev-i386 subversion flex uglifyjs git-core gcc-multilib p7zip p7zip-full msmtp libssl-dev texinfo libglib2.0-dev xmlto qemu-utils upx libelf-dev autoconf automake libtool autopoint

## do again

sudo apt-get update

sudo apt-get -y install build-essential asciidoc binutils bzip2 gawk gettext git libncurses5-dev libz-dev patch unzip zlib1g-dev lib32gcc1 libc6-dev-i386 subversion flex uglifyjs git-core gcc-multilib p7zip p7zip-full msmtp libssl-dev texinfo libglib2.0-dev xmlto qemu-utils upx libelf-dev autoconf automake libtool autopoint device-tree-compiler

sudo apt-get -y install build-essential asciidoc binutils bzip2 gawk gettext git libncurses5-dev libz-dev patch unzip zlib1g-dev lib32gcc1 libc6-dev-i386 subversion flex uglifyjs git-core gcc-multilib p7zip p7zip-full msmtp libssl-dev texinfo libglib2.0-dev xmlto qemu-utils upx libelf-dev autoconf automake libtool autopoint

## do again

sudo apt-get update

sudo apt-get -y install build-essential asciidoc binutils bzip2 gawk gettext git libncurses5-dev libz-dev patch unzip zlib1g-dev lib32gcc1 libc6-dev-i386 subversion flex uglifyjs git-core gcc-multilib p7zip p7zip-full msmtp libssl-dev texinfo libglib2.0-dev xmlto qemu-utils upx libelf-dev autoconf automake libtool autopoint device-tree-compiler

sudo apt-get -y install build-essential asciidoc binutils bzip2 gawk gettext git libncurses5-dev libz-dev patch unzip zlib1g-dev lib32gcc1 libc6-dev-i386 subversion flex uglifyjs git-core gcc-multilib p7zip p7zip-full msmtp libssl-dev texinfo libglib2.0-dev xmlto qemu-utils upx libelf-dev autoconf automake libtool autopoint



cd /home/$USER_NAME

sudo git clone https://github.com/coolsnowwolf/lede

cd lede

sudo ./scripts/feeds update -a

sudo ./scripts/feeds install -a


sudo ./scripts/feeds update -a

sudo ./scripts/feeds install -a


sudo make menuconfig

sudo make V=s
