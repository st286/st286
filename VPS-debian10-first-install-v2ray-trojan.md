#!/bin/bash
set -euo pipefail

# Code by St4swift, 30Nov2019

[ $(id -u) != "0" ] && { echo "Error: You must be root to run this scipt."; exit 1; }

# 更换.bashrc

cat > .bashrc << EOF
# ~/.bashrc: executed by bash(1) for non-login shells.

# Note: PS1 and umask are already set in /etc/profile. You should not
# need this unless you want different defaults for root.
PS1='${debian_chroot:+($debian_chroot)}\h:\w\$ '
umask 022

# You may uncomment the following lines if you want `ls' to be colorized:
export LS_OPTIONS='--color=auto'
eval "`dircolors`"
alias ls='ls $LS_OPTIONS'
alias ll='ls $LS_OPTIONS -l'
alias l='ls $LS_OPTIONS -lA'
#
# Some more alias to avoid making mistakes:
alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'

EOF

source .bashrc


# 更新package,并安装一些工具
apt update && apt upgrade -y
apt install curl wget htop nload lsof




# 安装nginx,用于trojan
apt update
apt install nginx

# 安装trojan

wget https://raw.githubusercontent.com/st286/st286.github.io/master/Trojan/trojan-first-install-debain.sh 
bash trojan-first-install-debain.sh

