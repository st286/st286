## Go Language

There are several tutorials on the Go website at https://go.dev such as the following:

• Getting started – https://go.dev/learn/

• A tutorial for the Go programming language – https://go.dev/doc/tutorial/getting-started

• Online and interactive tutorial – https://go.dev/tour/list

• Effective Go – https://go.dev/doc/effective_go

Go has a “playground” accessible from the main page that can be used to run code (https://go.dev/play/).


## GO 代理

**通过go env 设置环境变量：**

`go env -w GOPROXY=https://goproxy.io,direct`

可以将环境变量写入go 的配置文件中，长久生效

**取消代理：**

`go env -u GOPROXY`  

## GO something

`go version`  `go env`

### godoc and go doc

[The utility (or lack thereof) of godoc](https://forum.golangbridge.org/t/the-utility-or-lack-thereof-of-godoc/27906)

The godoc webserver is no longer included in the main binary distribution. To run the godoc webserver locally, manually install it first:
 
`go install golang.org/x/tools/cmd/godoc@latest`

