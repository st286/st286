# NaiveProxy + Caddy, NaiveProxy 搭建

NaiveProxy is an anticensorship tool that uses Chrome’s network stack to better camouflage your traffic. 

Prebuilt clients for NaiveProxy are available for Android, Linux, OpenWRT, macOS, and Windows.

NaïveProxy是一个基于谷歌浏览器的网络组建，进行数据包转发的套件，具体的用途，你们懂的呦，它最大的优势是TLS的流量指纹，是谷歌浏览器Chrome的，那个叫啥“泯然众人”，是的，流量就是特征就跟普通浏览器的一模一样了。

[NaïveProxy项目地址](https://github.com/klzgrad/naiveproxy)

[NaïveProxy 搭建部署安装教程 2022-4-8](https://dasmz.com/?p=1908)

[Oil and Fish: NaiveProxy + Caddy 2](https://www.oilandfish.com/posts/naiveproxy-caddy-2.html)

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

见上面文件: caddy.json； 注意修改示例值，SSL 证书需要自行准备； **证书见下面**。



### 产生伪装网站 Create Camouflage Website

So that your server can pass a manual inspection, install a few pages of web content. Make a directory for the web pages:

    mkdir -p /var/www/html

Install the prerequisite utilities:

    apt install wget zip unzip -y

Get some sample web pages from GitHub:

    wget https://github.com/arcdetri/sample-blog/archive/master.zip
    
    Unzip the downloaded sample web pages:

    unzip master.zip
    
Copy the web pages into place in your directory for web pages:

    cp -rf sample-blog-master/html/* /var/www/html/


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

config.json
```
{
  "listen": "socks://127.0.0.1:1080",
  "proxy": "https://user:password@xx.xxx.com",
  "log": ""
}
```

## 四、证书

**见 xray 部分**

**证书申请需要80端口，先运行caddy（用简单配置?????)**

[Caddy config here](https://caddyserver.com/docs/getting-started)


### 证书管理-申请tls证书
```
#注意： 请不要轻易使用自签证书。它并没有让操作简单太多，但增加了无谓的风险（如中间人攻击）。

apt install socat

wget -O -  https://get.acme.sh | sh

. .bashrc

acme.sh --upgrade --auto-upgrade

## maybe 

acme.sh --register-account -m xxxx@icloud.com

#测试证书申请:在正式申请证书之前，我们先用测试命令(--issue --test)来验证是否可以成功申请，这样可以避免在本地配置有误时，反复申请证书失败

acme.sh --issue --test -d xx.your.com -w /var/www/html --keylength ec-256

#如果这一步出错的话，你可以运行下面的命令，来查看详细的申请过程和具体的错误。

acme.sh --issue --test -d xx.your.com -w /var/www/html --keylength ec-256 --debug

#这一步确定成功之后，就可以申请正式的证书了。（测试证书不需要删除，它会自动被正式证书覆盖）

acme.sh --issue -d xx.your.com -w /var/www/html --keylength ec-256 --force

#说明： --force 参数的意思就是，在现有证书到期前，手动（强行）更新证书。上一步我们从“测试服”申请的证书虽然不能直接用，但是它本身是尚未过期的，所以需要用到这个参数。

```

### 给Xray配置TLS证书

```
mkdir /home/xray_cert

#使用acme.sh的--install-cert正确安装（拷贝）证书文件

acme.sh --install-cert -d  xx.your.com --ecc --fullchain-file /home/xray_cert/xray.crt --key-file /home/xray_cert/xray.key

chmod +r /home/xray_cert/xray.key

#acme.sh 会每60天检查一次证书并自动更新临期证书。但据我所知是它并不会自动将新证书安装给 xray-core，所以我们需要新增一个系统的自动周期任务来完成这一步。

nano /home/xray_cert/xray-cert-renew.sh

#把下面的内容复制进去，记得替换你的真实域名，然后保存退出, 替换xx.your.com 

#!/bin/bash

/root/.acme.sh/acme.sh --install-cert -d xx.your.com --ecc --fullchain-file /home/xray_cert/xray.crt --key-file /home/xray_cert/xray.key
echo "Xray Certificates Renewed"

chmod +r /home/xray_cert/xray.key
echo "Read Permission Granted for Private Key"

sudo systemctl restart xray
echo "Xray Restarted"


#给这个文件增加【可执行】权限
chmod +x /home/xray_cert/xray-cert-renew.sh

#运行 crontab -e，添加一个自动任务【每月自动运行一次xray-cert-renew.sh】
crontab -e

#把下面的内容增加在文件最后，保存退出即可。
# 1:00am, 1st day each month, run `xray-cert-renew.sh`
0 1 1 * *   bash /home/xray_cert/xray-cert-renew.sh

```




