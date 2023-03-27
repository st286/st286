
#  DICT　DICTD　GOLDENDICT

## 一、DICT协议

DICT是由DICT开发组创建的一个字典网络传输协议。1997年发表的RFC 2229首次提及该协议。用户的客户端通过DICT可以访问字典服务器查阅字典。DICT服务器和客户端使用TCP 2628端口。 

它和其他协议（如 HTTP/1.0、SMTP）一样，都非常简单，就是直接在 TCP 连接里使用人类可读的英文单词，进行一问一答的交流。它和互联网田园时代的其他协议（如 HTTP/1.0、SMTP）一样，都非常简单，就是直接在 TCP 连接里使用人类可读的英文单词，进行一问一答的交流。

[使用 dictd 搭建 DICT 字典服务器](https://wzyboy.im/post/1237.html)

[维基百科DICT](https://zh.wikipedia.org/zh-cn/DICT)

[在 Linux 命令行上使用 dict 文字工具](https://www.51cto.com/article/748625.html)

## 二、dict and dictd

Dictd 是实现DICT的服务器端，dict是客户端。各自的配置文件是（debian / ubuntu）：

/etc/dictd/dictd.conf

/etc/dictd/dict.conf

### 安装

    sudo apt-get install dictd dict

安装词典

    sudo apt-get install dict-gcide
    
#### 字典库文件存放在 /usr/share/dictd/,把下面'朗道字典'库四个文件copy到该目录中：

        angdao-ce.dict.dz, langdao-ce.index, langdao-ec.dict.dz, langdao-ec.index
        
#### 修改　/var/lib/dictd/db.list, 增加以下内容，把'朗道字典'加上
```
database gcide
 {
  data  /usr/share/dictd/gcide.dict.dz
  index /usr/share/dictd/gcide.index
}

database langdao-ce
 {
  data  /usr/share/dictd/langdao-ce.dict.dz
  index /usr/share/dictd/langdao-ce.index
}
database langdao-ec 
 {
  data  /usr/share/dictd/langdao-ec.dict.dz
  index /usr/share/dictd/langdao-ec.index
}

```
后面的两个内容(一个是汉英，一个是英汉)，添加的字典要有 dict.dz 和 index 两部分.因为不只一个用户使用这个字典，所以就直接把字典复制到了默认的 /usr/share/dictd/ .

##  三、使用

检查一下dictd服务是否在运行并且安装了什么数据库：

       dict -I

dictd 服务可用'systemctl'命令控制：
```
sudo systemctl status dictd
sudo systemctl restart dictd
...
```
**Usage:**

        dict -d 字典名   要查的词
        
## 四、字典dictionaries

[我收集的字典，在阿里云盘上](https://www.aliyundrive.com/drive/folder/62e1239b00371943d8e94aeeaa6d617b8c55bd42)

[StarDict Dictionaries -- 星际译王词库 词典下载](http://download.huzheng.org/)

[zh_CN 简体中文词典](http://download.huzheng.org/zh_CN/)

**以下字典来自[ yanyingwang/goldendict ](https://github.com/yanyingwang/goldendict):**

[mdict字典包](http://louischeung.top:225/)

[FreeMdict downloads](https://downloads.freemdict.com/)

**字典文件放在**

        /usr/share/dictd/

## 五、[GoldenDict-github](https://github.com/goldendict/goldendict)

除了 dict 这个命令行客户端，也有别的支持 DICT 协议的字典软件，比如 GoldenDict。据说 GNOME 和 Xfce 里自带的字典也是支持的，不过没有测试过。

在 GoldenDict 的「DICT Servers」字典源里添加 localhost 即可使用。

### [GoldenDict编译安装](https://github.com/goldendict/goldendict/blob/master/README.md)

#### Installing External Deps on Ubuntu Linux for Qt5
```
sudo apt-get install git pkg-config build-essential qt5-qmake \
     libvorbis-dev zlib1g-dev libhunspell-dev x11proto-record-dev \
     qtdeclarative5-dev libxtst-dev liblzo2-dev libbz2-dev \
     libao-dev libavutil-dev libavformat-dev libtiff5-dev libeb16-dev \
     libqt5webkit5-dev libqt5svg5-dev libqt5x11extras5-dev qttools5-dev \
     qttools5-dev-tools qtmultimedia5-dev libqt5multimedia5-plugins
```
#### How to build

        git clone https://github.com/goldendict/goldendict.git
    
**Building with Chinese conversion support**

To add Chinese conversion support you need at first install libopencc-dev package:

        sudo apt-get install libopencc-dev

Then pass "CONFIG+=chinese_conversion_support" to qmake

        qmake "CONFIG+=chinese_conversion_support"
        
**And then invoke qmake and make:**

        cd goldendict && qmake && make
        
**Then, invoke make clean before make because the setting change:**

        make clean && make

#### Installation

Installation is an optional step since the built binary can be used as-is without installation. But you can properly install via:

        make install

You can uninstall via:

        make uninstall


