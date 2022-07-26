
#  DICT和DICTD

## 一、DICT协议

DICT是由DICT开发组创建的一个字典网络传输协议。1997年发表的RFC 2229首次提及该协议。用户的客户端通过DICT可以访问字典服务器查阅字典。DICT服务器和客户端使用TCP 2628端口。 

它和其他协议（如 HTTP/1.0、SMTP）一样，都非常简单，就是直接在 TCP 连接里使用人类可读的英文单词，进行一问一答的交流。它和互联网田园时代的其他协议（如 HTTP/1.0、SMTP）一样，都非常简单，就是直接在 TCP 连接里使用人类可读的英文单词，进行一问一答的交流。

[使用 dictd 搭建 DICT 字典服务器](https://wzyboy.im/post/1237.html)

[维基百科DICT](https://zh.wikipedia.org/zh-cn/DICT)

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
        
## 　四、其他

除了 dict 这个命令行客户端，也有别的支持 DICT 协议的字典软件，比如 GoldenDict。据说 GNOME 和 Xfce 里自带的字典也是支持的，不过没有测试过。

在 GoldenDict 的「DICT Servers」字典源里添加 localhost 即可使用。
