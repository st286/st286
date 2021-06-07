# Xray --- Project X

Project X originates from XTLS protocol, provides a set of network tools such as Xray-core and Xray-flutter.

Xray-core 是 v2ray-core 的超集，含更好的整体性能和 XTLS 等一系列增强，且完全兼容 v2ray-core 的功能及配置。

[Project X](https://xtls.github.io)

[Xray-core](https://github.com/XTLS/Xray-core)

[Xray-install-sh](https://github.com/XTLS/Xray-install)

[小小白白话文](https://xtls.github.io/documents/level-0/)

[HelloWorld--OpenWrt](https://github.com/jerrykuku/luci-app-vssr)

---

# Install Xray

## 显示中文
```
# add to .bashrc
export LANG='UTC-8' 
export LC_ALL='en_US.UTF-8'

source .bashrc
```

## VPS 安全

```
# 生成SSH key
ssh-keygen -t ed25519 -C "xx.com" -f  xx-keyfile

#使用RSA密钥登录并禁用密码登录
nano /etc/ssh/sshd_config
#找到(ctrl+w) PasswordAuthentication 改成 no
#找到(ctrl+w) PubkeyAuthentication 改成 yes，然后保存(ctrl+o)退出(ctrl+x)
#重启SSH服务
systemctl restart ssh

```
## 网站建设

```
apt update &&  apt install nginx

#修改 /var/www/html/index.nginx-debian.html 

#修改 nginx.conf 并重启 Nginx 服务
nano /etc/nginx/nginx.conf

## 将下面一段，添加在 http{} 内

#include /etc/nginx/conf.d/*.conf;
#include /etc/nginx/sites-enabled/*;
server {
        listen 80;
        server_name 二级域名.你的域名.com;
        root /var/www/html;
        index index.nginx-debian.html;
}


# nginx 重新载入配置使其生效
systemctl reload nginx

# 此时如果你访问 http://二级域名.你的域名.com，你看到页面则说明成功。
```
## 证书管理-申请tls证书

```
#注意： 请不要轻易使用自签证书。它并没有让操作简单太多，但增加了无谓的风险（如中间人攻击）。

wget -O -  https://get.acme.sh | sh

. .bashrc

acme.sh --upgrade --auto-upgrade

#测试证书申请:在正式申请证书之前，我们先用测试命令(--issue --test)来验证是否可以成功申请，这样可以避免在本地配置有误时，反复申请证书失败

acme.sh --issue --test -d xx.your.com -w /var/www/html --keylength ec-256

#如果这一步出错的话，你可以运行下面的命令，来查看详细的申请过程和具体的错误。

acme.sh --issue --test -d xx.your.com -w /var/www/html --keylength ec-256 --debug

#这一步确定成功之后，就可以申请正式的证书了。（测试证书不需要删除，它会自动被正式证书覆盖）

acme.sh --issue -d xx.your.com -w /var/www/html --keylength ec-256 --force

#说明： --force 参数的意思就是，在现有证书到期前，手动（强行）更新证书。上一步我们从“测试服”申请的证书虽然不能直接用，但是它本身是尚未过期的，所以需要用到这个参数。

```
## Xray server setup

### 安装Xray
```
wget https://github.com/XTLS/Xray-install/raw/main/install-release.sh
bash install-release.sh
rm install-release.sh

#Filesystem Hierarchy Standard (FHS)

        installed: /etc/systemd/system/xray.service
        installed: /etc/systemd/system/xray@.service

        installed: /usr/local/bin/xray
        installed: /usr/local/etc/xray/*.json

        installed: /usr/local/share/xray/geoip.dat
        installed: /usr/local/share/xray/geosite.dat

        installed: /var/log/xray/access.log
        installed: /var/log/xray/error.log
        
#Notice: Xray will NOT log to /var/log/xray/*.log by default. Configure "log" to specify log files.
```
[Xray-install-sh Readme](https://github.com/XTLS/Xray-install)

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
### 配置Xray
```
# 生成UUID
xray uuid

#配置 /usr/local/etc/xray/config.json
wget https://raw.githubusercontent.com/st286/st286.github.io/master/Xray/xray-config.json

# 修改 xray-config.json， 将之前生成的UUID填入第61行 "id": "", 之中

mv ./xray-config.json  /usr/local/etc/xray/config.json

```
### 启动Xray服务--systemd基本服务管理
```
systemctl enable xray
systemctl start xray
systemctl status xray

systemctl stop xray
systemctl restart xray
systemctl disable xray

systemctl daemon-reload
 
```
### 服务器优化：开启HTTP自动跳转HTTPS
```
#之前我们已经搭建了 80 端口的 http 网页，并以此申请了TLS证书。
#但如果你尝试过用浏览器访问我们的这个界面，就会发现 http 访问并不会像大多数网站一样自动升级为 https 访问。换言之，我们现在的设置下，http(80) 和 https(443)之间完全是独立的。如果要解决这个问题，就需要做一些修改。

nano /etc/nginx/nginx.conf


#修改如下 http{}中：
	#include /etc/nginx/conf.d/*.conf;
	#include /etc/nginx/sites-enabled/*;

	server {
               listen  80;
               server_name  xx.your.com;
               return 301 https://$http_host$request_uri;
        }

	server {
                listen 127.0.0.1:8080;
                root /var/www/html;
                index index.nginx-debian.html;
                add_header Strict-Transport-Security "max-age=63072000" always;
	}

#重启 Nginx 服务
systemctl restart nginx

#修改Xray的回落设置，将回落从 80 端口改为 8080 端口。（找到 "dest": 80, 并改成 "dest": 8080）
nano /usr/local/etc/xray/config.json

#重启 Xray 服务，即完成了设置
systemctl restart xray

```


