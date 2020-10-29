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
------

固件里面看不到ssr-plus
大佬在feed里里面吧ssr的feed隐藏了

```shell
cd lede
git pull
rm -rf ./tmp
nano feeds.conf.default #其中去掉注释
./script/feeds update -a && ./script/feeds install -a
```

feeds.conf.default: as following

```shell
src-git luci https://github.com/coolsnowwolf/luci
src-git routing https://git.openwrt.org/feed/routing.git;openwrt-19.07
#src-git telephony https://git.openwrt.org/feed/telephony.git;openwrt-19.07
#src-git helloworld https://github.com/fw876/helloworld
```


### 临时使用socks5代理apt-get的方法

      sudo apt-get -o Acquire::http::proxy="socks5h://127.0.0.1:1080/"  update 

### git 使用代理

      git config --global  http.proxy socks5://127.0.0.1:1080

      git config --global --unset http.proxy
