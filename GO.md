
**通过go env 设置环境变量：**

`go env -w GOPROXY=https://goproxy.io,direct`

可以将环境变量写入go 的配置文件中，长久生效

**取消代理：**

`go env -u GOPROXY`  
