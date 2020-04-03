# 编译Openwrt固件全攻略


## [编译Lean的Openwrt固件全攻略](https://imgki.com/archives/openwrt-lean.html)

## [Lienol openwrt passwall](https://github.com/Lienol/openwrt)

## [Lead openwrt ssr-plus](https://github.com/coolsnowwolf/lede)

## [openwrt office](https://github.com/openwrt/openwrt)

## [openwrt-trojan](https://github.com/trojan-gfw/openwrt-trojan)


```shell
USER_NAME=st

##创建用户
useradd -m $USER_NAME -d /home/$USER_NAME -s /bin/bash

passwd $USER_NAME

 #"visudo /etc/sudoers: add $USER_NAME    ALL=(ALL:ALL) ALL"

visudo

## 转换非root用户
su $USER_NAME

```


