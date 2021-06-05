# Xray --- Project X

Project X originates from XTLS protocol, provides a set of network tools such as Xray-core and Xray-flutter.

Xray-core 是 v2ray-core 的超集，含更好的整体性能和 XTLS 等一系列增强，且完全兼容 v2ray-core 的功能及配置。

[Project X](https://xtls.github.io)

[Xray-core](https://github.com/XTLS/Xray-core)

[小小白白话文](https://xtls.github.io/documents/level-0/)

[HelloWorld--OpenWrt](https://github.com/jerrykuku/luci-app-vssr)

---

# Install Xray

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
## 证书管理

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

acme.sh --issue -d 二级域名.你的域名.com -w /var/www/html --keylength ec-256 --force



```

