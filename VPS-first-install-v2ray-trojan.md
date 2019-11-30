#!/bin/bash

# Code by St4swift, 30Nov2019

[ $(id -u) != "0" ] && { echo "Error: You must be root to run this scipt."; exit 1; }

# 更新package,并安装一些工具
apt update && apt upgrade -y
apt install curl wget htop nload lsof




# 安装nginx,用于trojan
apt update
apt install nginx

# 安装trojan

wget https://raw.githubusercontent.com/st286/st286.github.io/master/Trojan/trojan-first-install-debain.sh 
bash trojan-first-install-debain.sh

