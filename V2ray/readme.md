
## 安装 V2ray

  `wget -O v2ray-first-install.sh  https://raw.githubusercontent.com/st286/st286.github.io/master/V2ray/v2ray-first-install.sh`

  `bash v2ray-first-install.sh`

### OR
`wget -O v2ray-install.sh https://install.direct/go.sh`

`bash v2ray-install.sh`

`bash v2ray-install.sh -c`

`bash v2ray-install.sh -h`

`service v2ray start `

脚本运行完成，需要：

  1. 编辑 /etc/v2ray/config.json 文件来配置代理方式；
  2. 运行 service v2ray start 来启动 V2Ray 进程；
  3. 之后可以使用 service v2ray start|stop|status|reload|restart|force-reload 控制 V2Ray 的运行。

### OR

```shell
  # installation:
  
  	bash <(curl -L -s https://install.direct/go.sh)
  
  # Upgrade:
  
	 bash <(curl -L -s https://install.direct/go.sh) -c

  # Help:
  
	bash <(curl -L -s https://install.direct/go.sh) -h

```

## 启动v2ray

```shell
	service v2ray start 
	
	systemctl start v2ray
	
	restart  enable  status

```
