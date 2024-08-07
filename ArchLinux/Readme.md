---
# Distro based on ArchLinux

[asahi linux on Apple Silicon](https://asahilinux.org/)

[manjaro](https://manjaro.org/)

[endeavouros](https://endeavouros.com/)

---
# 配置 

[Pamac简介](https://wiki.manjaro.org/index.php/Pamac/zh-cn)

[pacman](https://wiki.archlinux.org/title/Pacman)

[Localization/Chinese](https://wiki.archlinux.org/title/Localization/Chinese#Fonts)

[Fonts (简体中文)](https://wiki.archlinux.org/title/Fonts_(%E7%AE%80%E4%BD%93%E4%B8%AD%E6%96%87))

[如何在 Manjaro 21 Linux 上安装 Microsoft 字体](https://zh-cn.linuxcapable.com/%E5%A6%82%E4%BD%95%E5%9C%A8-manjaro-21-linux-%E4%B8%8A%E4%BD%BF%E7%94%A8%E5%BE%AE%E8%BD%AF%E5%AD%97%E4%BD%93/)

[安装Manjaro之后的配置 ](https://panqiincs.me/2019/06/05/after-installing-manjaro/)

[Localization (简体中文)](https://wiki.archlinux.org/title/Localization_(%E7%AE%80%E4%BD%93%E4%B8%AD%E6%96%87)/Simplified_Chinese_(%E7%AE%80%E4%BD%93%E4%B8%AD%E6%96%87))

---
# 安装和卸载AUR软件包

### 安装

在下面的链接中找到你需要的包
    
[AUR仓库](https://aur.archlinux.org/packages)
    
克隆仓库
    
在 Git Clone URL 那一行复制git仓库的下载地址，在终端切到你存放仓库的目录下运行以下命令
    
`git clone 仓库链接`
    
这样你就将仓库复制到了本地

打包安装
    
切到下载的仓库目录下，在这个目录下应该有一个PKGBUILD文件，接下来运行以下命令就能安装了
    
 `makepkg -si`

### 卸载

和普通的官方软件没什么区别，执行以下命令
`pacman -Rs 包名`

原文链接：https://blog.csdn.net/superstar_zbt/article/details/100886054


---
# 安装manjaro后的使用

## [Pacman vs Pamac vs Yay](https://archived.forum.manjaro.org/t/pacman-vs-pamac-vs-yay/122495)

**manjaro 建议优先使用 pamac**

**They all install packages:**

	pamac is Manjaro's package manager and it can install packages from the Manjaro repos or AUR

	pacman is the package manager from Arch. It can only install packages from the repos.

	yay is a wrapper that can install packages from the Manjaro repos or AUR.

	Feel free to use whichever you prefer

	EDIT: pamac also has a GUI version available pamac-manager which is in the menus as "Add/Remove Software"

## [General recommendations (简体中文)](https://wiki.archlinux.org/title/General_recommendations_(%E7%AE%80%E4%BD%93%E4%B8%AD%E6%96%87))

##  yay

[How to Install yay AUR Helper in Arch Linux [Beginner’s Guide]](https://www.debugpoint.com/install-yay-arch/#install-yay-manjaro)

[初级：如何在 Arch Linux 中安装 Yay AUR 助手](https://linux.cn/article-14846-1.html)
```
sudo pacman -Syu
sudo pacman -S yay

# 刷新包并升级
yay -Syu

# 删除任何包
yay -Rns xxxx

# 取系统统计信息
yay -Ps

```
---
# manjaro安装中文fonts

```
### adobe source han fonts, arphic fonts, New Sung font, wqy fonts 
sudo pacman -Syu
sudo pacman -S adobe-source-han-sans-cn-fonts adobe-source-han-serif-cn-fonts ttf-arphic-ukai ttf-arphic-uming  opendesktop-fonts  wqy-bitmapfont wqy-zenhei   wqy-microhei  

```


```
### Windows Chinese fonts 
yay -S ttf-ms-fonts
 
### 卸载Microsoft 字体
### 当您不再希望在系统上安装字体时，请使用以下命令将其删除。
yay -Rns ttf-ms-fonts

### 或者，您可以运行以下命令来清理任何剩余的未使用依赖项，强烈建议您运行此命令，这样您的系统就不会变得臃肿。
yay -Yc

```
---
# manjaro安装配置中文输入法fcitx5
```
## 先删除fcitx软件包
sudo pacman -Rs $(pacman -Qsq fcitx)

## 安装fcitx5软件包
## fcitx5: 输入法基础框架主程序
## fcitx5-configtool(kcm-fcitx5)：输入法配置程序(KDE桌面环境的支持)
## fcitx5-qt: QT5程序的支持 
##  fcitx5-gtk: GTK程序的支持 
## fcitx5-chinese-addons: 简体中文输入的支持，拼音.(五笔,内置）
sudo pacman -S fcitx5 fcitx5-configtool fcitx5-qt fcitx5-gtk fcitx5-chinese-addons

## 修改环境变量
sudo vim /etc/profile

## 加入下面四行，并注销，重登录

# fcitx5
export GTK_IM_MODULE=fcitx5
export QT_IM_MODULE=fcitx5
export XMODIFIERS=@im=fcitx5

```
[Fcitx5 (简体中文)](https://wiki.archlinux.org/title/Fcitx5_(%E7%AE%80%E4%BD%93%E4%B8%AD%E6%96%87))

---
# app after installation

chinese calendar

telegram

expressvpn

tor

--- 
# ArchEX Linux Live DVD

[ArchEX Linux](http://archex.exton.net/)

### WHAT IS ArchEX?

ArchEX 64 bit is a new (200914) Linux live DVD based on Arch Linux. Arch motto is KISS (Keep It Simple Stupid). ArchEX uses kernel 5.8.8-arch1-1, Deepin 20 BETA and LXQt 0.15.0 Desktop environments. Deepin 15.11 Desktop (made in China!) is devoted to providing a beautiful, easy to use, safe and reliable system for global users. About LXQt 0.15.0: LXQt is a lightweight Qt desktop environment. It will not get in your way. It will not hang or slow down your system. It is focused on being a classic desktop with a modern look and feel.


## Install Arch Linux on a removable medium (install to usb)


[install to removable](https://wiki.archlinux.org/index.php/Install_Arch_Linux_on_a_removable_medium)

[Arch USB](https://magyar.urown.cloud/arch-usb.html)


[ALMA](https://github.com/r-darwish/alma)


## Arch installation

[archlinux wiki](https://wiki.archlinux.org/)


### install zsh

	pacman -S zsh
  
  	chsh -s $(which zsh)

### install oh-my-zsh

	sh -c "$(wget -O- https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
