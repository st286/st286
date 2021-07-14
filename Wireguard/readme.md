#  WireGuard®

[How to get started with WireGuard VPN](https://upcloud.com/community/tutorials/get-started-wireguard-vpn/)

[How to easily configure WireGuard](https://www.stavros.io/posts/how-to-configure-wireguard/)

[Debian Linux VPS 服务器 WireGuard 安装教程](https://p3terx.com/archives/debian-linux-vps-server-wireguard-installation-tutorial.html)

[Set Up WireGuard VPN on Ubuntu](https://www.linode.com/docs/guides/set-up-wireguard-vpn-on-ubuntu/)

[翻译】如何轻松配置 WireGuard](https://www.wogong.net/blog/2019/01/how-to-configure-wireguard)

#  Installing and Configuring WireGuard® on Linux as a VPN server

## 安装 WireGuard

添加 back­ports 源
```
apt install curl lsb-release -y
echo "deb http://deb.debian.org/debian $(lsb_release -sc)-backports main" | tee /etc/apt/sources.list.d/backports.list
apt update
```
安装网络工具包
```
apt install net-tools iproute2 openresolv dnsutils -y
```
安装 wireguard-tools ((Wire­Guard 配置工具：wg、wg-quick)
```
apt install wireguard-tools --no-install-recommends
```
先执行 uname -r 命令查看内核版本。如果是 5.6 以上内核则已经集成了 Wire­Guard ，就不需要安装了。如果不是，执行下面的命令
```
apt -t $(lsb_release -sc)-backports install linux-image-$(dpkg --print-architecture) linux-headers-$(dpkg --print-architecture) --install-recommends -y
```
重启
```
reboot
```
查看版本（ 5.6 以上就可以了）
```
uname -r
```

## Server configuration

### Generating private and public keys






# 
