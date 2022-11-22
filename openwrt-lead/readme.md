# 编译Openwrt固件全攻略

### [Passwall, SSR-plus, VSSR](https://github.com/kenzok8/openwrt-packages)

### [编译更新OpenWrt PassWall和SSR-plus插件](https://mianao.info/2020/05/05/编译更新OpenWrt-PassWall和SSR-plus插件)

### [编译Lean的Openwrt固件全攻略](https://imgki.com/archives/openwrt-lean.html)

### [Lienol openwrt passwall](https://github.com/Lienol/openwrt)

### [Lead openwrt ssr-plus](https://github.com/coolsnowwolf/lede)

### [HelloWorld](https://github.com/jerrykuku/luci-app-vssr)

### [openwrt office](https://github.com/openwrt/openwrt)

### [openwrt-trojan](https://github.com/trojan-gfw/openwrt-trojan)

---

### 注意

   1.不要用 root 用户进行编译
   
   2.中国大陆用户编译前最好准备好梯子
   
   3.默认登陆IP 192.168.1.1 密码 password
   
   
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
## 编译命令 ( passwall, ssrp and helloworld (vssr) )

#### 1.首先装好 Linux 系统，推荐  Ubuntu20.0 LTS

#### 2.安装编译依赖

```
sudo apt update -y
sudo apt full-upgrade -y
sudo apt install -y ack antlr3 asciidoc autoconf automake autopoint binutils bison build-essential \
bzip2 ccache cmake cpio curl device-tree-compiler fastjar flex gawk gettext gcc-multilib g++-multilib \
git gperf haveged help2man intltool libc6-dev-i386 libelf-dev libglib2.0-dev libgmp3-dev libltdl-dev \
libmpc-dev libmpfr-dev libncurses5-dev libncursesw5-dev libreadline-dev libssl-dev libtool lrzsz \
mkisofs msmtp nano ninja-build p7zip p7zip-full patch pkgconf python2.7 python3 python3-pip qemu-utils \
rsync scons squashfs-tools subversion swig texinfo uglifyjs upx-ucl unzip vim wget xmlto xxd zlib1g-dev
```

#### 3.下载源代码，更新 feeds 并选择配置

```
git clone https://github.com/coolsnowwolf/lede

cd lede/package/lean/
git clone https://github.com/jerrykuku/lua-maxminddb.git  #git lua-maxminddb 依赖
git clone https://github.com/jerrykuku/luci-app-vssr.git  

cd ..
cd ..
## goto lede/
```
固件里面看不到ssr-plus，大佬在feed里里面吧ssr的feed隐藏了.

修改 feeds.conf.default， 如下：
`vim feeds.conf.default`

```
src-git packages https://github.com/coolsnowwolf/packages
src-git luci https://github.com/coolsnowwolf/luci
src-git routing https://git.openwrt.org/feed/routing.git
src-git telephony https://git.openwrt.org/feed/telephony.git
#src-git video https://github.com/openwrt/video.git
#src-git targets https://github.com/openwrt/targets.git
#src-git oldpackages http://git.openwrt.org/packages.git

src-link custom /usr/src/openwrt/custom-feed   #本行，是手工去掉注释#

src-git helloworld https://github.com/fw876/helloworld
src-git passwall https://github.com/xiaorouji/openwrt-passwall

src-git kenzok https://github.com/kenzok8/openwrt-packages  
src-git small https://github.com/kenzok8/small  

## 最后四行，是手工添加上
##  加入kenzok8整合的themes和我们需要和实用的插件
```

修改后保存，继续：
```
./scripts/feeds update -a && ./scripts/feeds install -a

make menuconfig
```

#### Menu --> LuCI --> Applications -->  select...

      luci-app-ssr-plus (NEW) 
      
      luci-app-passwall

      luci-app-vssr.................... A New SS/SSR/Xray/Trojan LuCI interface (NEW)


#### 4.下载 dl 库，编译固件 （-j 后面是线程数，第一次编译推荐用单线程）

```
make download
make V=s -j1
```


---
---

## 固件里面看不到ssr-plus，大佬在feed里里面吧ssr的feed隐藏了


```
cd lede
git pull
rm -rf ./tmp

nano feeds.conf.default

./scripts/feeds update -a && ./scripts/feeds install -a

```

**feeds.conf.default: as following**

```
src-git packages https://github.com/coolsnowwolf/packages
src-git luci https://github.com/coolsnowwolf/luci
src-git routing https://git.openwrt.org/feed/routing.git
src-git telephony https://git.openwrt.org/feed/telephony.git
#src-git video https://github.com/openwrt/video.git
#src-git targets https://github.com/openwrt/targets.git
#src-git oldpackages http://git.openwrt.org/packages.git

src-link custom /usr/src/openwrt/custom-feed   #本行，是手工去掉注释#

src-git helloworld https://github.com/fw876/helloworld
src-git passwall https://github.com/xiaorouji/openwrt-passwall

src-git kenzok https://github.com/kenzok8/openwrt-packages  
src-git small https://github.com/kenzok8/small  

## 最后四行，是手工添加上
##  加入kenzok8整合的themes和我们需要和实用的插件
```
---

# 编译生成的映像文件
```
cd  lede/bin/targets/x86/64

ls 

openwrt-x86-64-generic-squashfs-combined-efi.img # 这个文件就是所要的

or

openwrt-x86-64-generic-squashfs-combined-efi.img.gz  # 这个文件就是所要的

#默认登陆IP 192.168.1.1 root 密码 password
```

---
# Tmux 使用
```
按下Ctrl+d或者显式输入exit命令，就可以退出 Tmux 窗口

按下Ctrl+b，再按下?，就会显示帮助信息。

按下Ctrl+b d或者输入tmux detach命令，就会将当前会话与窗口分离.

tmux ls命令可以查看当前所有的 Tmux 会话。

tmux attach命令用于重新接入某个已存在的会话:  tmux attach -t 0

```
[Tmux 使用教程](https://www.ruanyifeng.com/blog/2019/10/tmux.html)



## 临时使用socks5代理apt-get的方法

      sudo apt-get -o Acquire::http::proxy="socks5h://127.0.0.1:1080/"  update 

## git 使用代理

      git config --global  http.proxy socks5://127.0.0.1:1080

      git config --global --unset http.proxy
