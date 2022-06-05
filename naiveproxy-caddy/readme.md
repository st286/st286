# NaiveProxy + Caddy, NaiveProxy 搭建

NaiveProxy is an anticensorship tool that uses Chrome’s network stack to better camouflage your traffic. 

Prebuilt clients for NaiveProxy are available for Android, Linux, OpenWRT, macOS, and Windows.

NaïveProxy是一个基于谷歌浏览器的网络组建，进行数据包转发的套件，具体的用途，你们懂的呦，它最大的优势是TLS的流量指纹，是谷歌浏览器Chrome的，那个叫啥“泯然众人”，是的，流量就是特征就跟普通浏览器的一模一样了。

[NaïveProxy项目地址](https://github.com/klzgrad/naiveproxy)

[NaïveProxy 搭建部署安装教程 2022-4-8](https://dasmz.com/?p=1908)

[NaiveProxy 搭建教程](https://lhy.life/20211218-naiveproxy/)


## 一、环境

Debian 10 or ubuntu;  golang;  caddy，因为需要其正向代理的功能，Nginx目前不支持。

### Golang 

Downloads:  https://go.dev/dl/

```
apt update && apt upgrade -y
mkdir -p /root/src
cd /root/src
wget https://go.dev/dl/go1.18.3.linux-amd64.tar.gz
tar -C /usr/local/ -zxvf go1.18.3.linux-amd64.tar.gz

#  ~/.bash_profile or .bashrc 中添加 GO语言的 环境变量
export PATH=$PATH:/usr/local/go/bin

source .bash_profile

which go
go version

```
## 二、安装NaïveProxy和Caddy

需要安装NaïveProxy，且不是单独安装Caddy，务必按照命令执行。以下命令，在服务器上执行，需要保证服务器到github的网络通畅。编译build需要一定的时间，看你服务器的CPU性能，耐心等待。

```
cd /root/src/
go install github.com/caddyserver/xcaddy/cmd/xcaddy@latest
~/go/bin/xcaddy build --with github.com/caddyserver/forwardproxy@caddy2=github.com/klzgrad/forwardproxy@naive

./caddy version   

./caddy help

```
### Caddy的配置文件

see above file: caddy.json

### 运行服务端
```
./caddy start -config caddy.json 
```
## 三、客户端配置

到[naiveproxy Rebased](https://github.com/klzgrad/naiveproxy/releases)页面，下载 NaiveProxy 对应的客户端，解压执行，尽量用新版本的，修改config.json配置文件，编辑客户端配置文件。

### 客户端执行
```
naive config.json
```


