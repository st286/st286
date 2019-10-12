## Linux Mint安装ibus五笔和拼音输入法简明教程

介绍Linux Mint安装ibus输入法框架的五笔和拼音输入法

### Linux Mint使用终端安装ibus五笔和拼音输入法

按Ctrl+Alt+T快捷键打开终端，然后运行下面的命令。ibus是输入法框架，ibus-table-wubi是五笔输入法引擎，ibus-pinyin是拼音输入法引擎。

```shell
apt-get install ibus ibus-table-wubi ibus-pinyin
```

### 设置Linux Mint的输入法框架

Linux Mint没有默认的输入法框架，我们可以在终端里用im-config工具来设置一个输入法框架。im-config的意思是input method configuration（输入法配置）。输入下面的命令：
```shell
im-config -n ibus
```

-n是name的缩略。上面的命令会告诉im-config输入法框架的名字是ibus。


### 在ibus输入法框架里添加五笔或拼音输入法

在终端里输入下面的命令打开ibus输入法框架的配置窗口

```shell
ibus-setup
```

setup就是配置，设置的意思．初次运行这个命令会有一个提示，说ibus-daemon不在运行，是否要启动它？我们选择＂是＂,再点击确定．现在就进入ibus配置窗口了.
进行配置... OK
