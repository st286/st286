# 编译Openwrt固件全攻略

### [Passwall, SSR-plus, VSSR](https://github.com/kenzok8/openwrt-packages)

### [编译更新OpenWrt PassWall和SSR-plus插件](https://mianao.info/2020/05/05/编译更新OpenWrt-PassWall和SSR-plus插件)

### [编译Lean的Openwrt固件全攻略](https://imgki.com/archives/openwrt-lean.html)

### [Lienol openwrt passwall](https://github.com/Lienol/openwrt)

### [Lead openwrt ssr-plus](https://github.com/coolsnowwolf/lede)

### [HelloWorld](https://github.com/jerrykuku/luci-app-vssr)

### [openwrt office](https://github.com/openwrt/openwrt)

### [openwrt-trojan](https://github.com/trojan-gfw/openwrt-trojan)


```shell
USER_NAME=st

##创建用户
useradd -m $USER_NAME -d /home/$USER_NAME -s /bin/bash

passwd $USER_NAME

 #"visudo /etc/sudoers: add $USER_NAME    ALL=(ALL:ALL) ALL"
 
 ALL=(ALL) NOPASSWD: ALL 即可。
#注意： 我要特别说明的是NOPASSWD这个设置，它的意思用户$USER_NAME临时使用root权限时，不用额外输入密码。这与一般的安全建议相反。我之所以如此推荐，是因为很多新人不顾危险坚持使用root账号就是因为用root时不用重复输入密码、觉得轻松。“两害相权取其轻”，我认为【直接用root用户的风险】大于【使用sudo时不用输密码的风险】，所以做了以上的建议。
如果你希望遵守传统习惯、每次使用sudo时需要输入密码，那么这一行改成 $USER_NAME ALL=(ALL:ALL) ALL 即可。

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
./scripts/feeds update -a && ./scripts/feeds install -a
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
