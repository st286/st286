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


