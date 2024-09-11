# Homebrew macOS（或 Linux）缺失的软件包的管理器

            https://brew.sh/zh-cn/

# Install the Command Line Tools for Xcode 16 from:
      
      https://developer.apple.com/download/all/

  developer tools:  

      xcode-select 
      
      /Library/Developer/CommandLineTools

   重装:  
   
       sudo rm -rf /Library/Developer/

       go to https://developer.apple.com/download/all/  download command line tools

# Virtual machine

[Orbstack](https://orbstack.dev/)

Say goodbye to slow, clunky containers and VMs

Seamless and efficient Docker and Linux on your Mac. Glide through your work faster with our Docker Desktop alternative.



# Editor

[MacVim -- Vim - the text editor - for macOS](https://github.com/macvim-dev/macvim)

<details>
  <summary> [Emacs and Vi modes in Bash](https://mywiki.wooledge.org/set-o-vi-emacs) </summary>

#### Vi Mode

$ set -o vi
Vi mode allows for the use of vi like commands when at the bash prompt. When set to this mode initially you will be in insert mode (be able to type at the prompt unlike when you enter vi). Hitting the escape key takes you into command mode.
Commands to take advantage of bash's Vi Mode:

h - Move cursor left

l - Move cursor right

A - Move cursor to end of line and put in insert mode

0 - (zero) Move cursor to beginning of line (doesn't put in insert mode)

i - Put into insert mode at current position

a - Put into insert mode after current position

dd - Delete line (saved for pasting)

D - Delete text after current cursor position (saved for pasting)

p - Paste text that was deleted

j - Move up through history commands

k - Move down through history commands

u - Undo

</details>

---
# [Old mac, New macOS : OpenCore Legacy Patcher](https://github.com/dortania/OpenCore-Legacy-Patcher)

老 macbook 成功吃上macOS 12（已支持13），使用了OpenCore Legacy Patcher ，它基于Python的项目，原理是在内存中注入修补数据，让老MacBook安装新版的Mac OS，并运行和解锁新OS的相关功能，实现近乎原生的体验。

Main goal is to breathe new life into Macs no longer supported by Apple, allowing for the installation and usage of macOS Big Sur and newer on machines as old as 2007.

[Supported Models](https://dortania.github.io/OpenCore-Legacy-Patcher/MODELS.html)

---
# [rage: Rust implementation of age](https://github.com/str4d/rage)
```
$ rage -R file1.pub example.png > example.png.age
$ rage -d -i file2 example.png.age > example.png
```
# [How to Use ssh-keygen to Generate a New SSH Key](https://www.ssh.com/academy/ssh/keygen)

---
# [沉浸式翻译：](https://immersivetranslate.com)

1⃣能自定义ChatGPT、DeepL 等作为翻译源，我现在用的是 GPT 

2⃣ 可以对照翻译网页，格式排版都很好

3⃣支持快捷翻译输入框内容

4⃣还支持对照翻译 SRT 字幕、PDF、EPUB 文档

用了就回不去了，强烈推荐：https://immersivetranslate.com

---
#### [WindowSwap Blog](https://www.window-swap.com/Window)

WindowSwap is here to fill that deep void in our wanderlust hearts by allowing us to look through someone else's window, somewhere in the world.



#  [macOS sudo免密设置](https://blog.csdn.net/cengjingcanghai123/article/details/119797480)
```
chmod u+w /etc/sudoers, sudo vim /etc/sudoers, chmod u-w /etc/sudoers

user    ALL = (ALL)NOPASSWD: ALL
```

####   [Silicon - Identify Intel-Only Apps on your Mac with ease](https://github.com/DigiDNA/Silicon)


####   [Debug menu in Safari for macOS](https://appletoolbox.com/not-seeing-the-debug-menu-in-safari-for-macos-big-sur-safari-14-fix-it/)


####   [BetterDisplay](https://github.com/waydabber/BetterDisplay)


####   [VeraCrypt is a free open source disk encryption software for Windows, Mac OSX and Linux](https://veracrypt.fr/)


####   [macFUSE allows you to extend macOS via third party file systems.](https://github.com/osxfuse/osxfuse)


####  [HOW TO MOUNT AN EXT PARTITION ON A MAC](https://hackmylinux.com/2018/02/18/how-to-mount-and-read-a-linux-partition-on-a-mac-ext2-ext3-ext4/)


####  [How to Mount and Access Ext4 Partition in Mac](https://www.maketecheasier.com/mount-access-ext4-partition-mac/)


####  [How to Write to NTFS Drives on a Mac](https://www.howtogeek.com/236055/how-to-write-to-ntfs-drives-on-a-mac/)



####  [How to Flush DNS on Mac – MacOS Clear DNS Cache](https://www.freecodecamp.org/news/how-to-flush-dns-on-mac-macos-clear-dns-cache/)


####  [How to Flush DNS Cache on a Mac](https://www.lifewire.com/flush-dns-cache-on-a-mac-5209298)


  `sudo dscacheutil -flushcache && sudo killall -HUP mDNSResponder`

---

####  [How to Allow Apps to be Downloaded & Opened from Anywhere on MacOS Ventura](https://osxdaily.com/2022/11/17/allow-apps-downloaded-open-anywhere-macos/)


  `sudo spctl --master-disable` 


  System Settings --> Privacy & Security


  `sudo spctl --master-enable`

---

####  [Getting the bundle identifier of an OS X application in a shell script](https://superuser.com/questions/346369/getting-the-bundle-identifier-of-an-os-x-application-in-a-shell-script)


`mdls -name kMDItemCFBundleIdentifier -r /Applications/SomeApp.app`

---

####  [iSH -  Linux shell running on iOS](https://github.com/ish-app/ish) and [iSH wiki](https://github.com/ish-app/ish/wiki)


####  [Etcher - Flash OS images to SD cards & USB drives](https://github.com/balena-io/etcher)


####  [Best Free download manager for Mac - Folx](https://www.electronic.us/products/folx/)


####  [JustPlay - Lightweight video player](https://www.electronic.us/just-play.html)


####  [VirtualBox - a general-purpose full virtualizer](https://www.virtualbox.org)


---
####  [iPhone Wiki - Apple Devices硬件与软件信息收集](https://www.theiphonewiki.com) and [Baseband device 基带设备](https://www.theiphonewiki.com/wiki/Baseband_Device)


####  [ macOS package包管理 ](./package.md)


#### [iMazing - iPhone, iPad and iPod manager, and  app download](https://imazing.com/downloads)


####  [macOS iOS fonts 字体](./fonts.md)


####  [Command Line Tools for Xcode 14.1 Release Candidate 2](https://developer.apple.com/download/all/?q=Xcode) and [Command Line Tools for Xcode 13.4](https://download.developer.apple.com/Developer_Tools/Command_Line_Tools_for_Xcode_13.4/Command_Line_Tools_for_Xcode_13.4.dmg)


`   xcode-select  -h`  `softwareupdate`  

####  [Install Command Line Tools in Mac OS X (Without Xcode)](https://osxdaily.com/2014/02/12/install-command-line-tools-mac-os-x/)
  
---
####  [Osxdaily](https://osxdaily.com) and [Mac云课堂 ](https://www.youtube.com/channel/UCGHCIkfEHaKT7zsq8wzqeOQ)


####  [MonitorControl - Controls your external display brightness and volume](https://github.com/MonitorControl/MonitorControl)


####  [Mediahuman - YouTube to MP3 Converter, Audio Converter, mTube](https://www.mediahuman.com/)


####  [Install Rosetta 2 on Apple Silicon Macs](https://osxdaily.com/2020/12/04/how-install-rosetta-2-apple-silicon-mac/)

  `/usr/sbin/softwareupdate --install-rosetta --agree-to-license`


####  [MacOS终端走代理](https://github.com/mrdulin/blog/issues/18) and [MacOS终端命令](https://github.com/qLzhu/macCommand)
