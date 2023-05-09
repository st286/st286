## Go Language

There are several tutorials on the Go website at https://go.dev such as the following:

Getting started – https://go.dev/learn/

A tutorial for the Go programming language – https://go.dev/doc/tutorial/getting-started

Online and interactive tutorial – https://go.dev/tour/list

Effective Go – https://go.dev/doc/effective_go

Go has a “playground” accessible from the main page that can be used to run code (https://go.dev/play/).


### the Go Standard Library (https://pkg.go.dev/std).

The Go team also built a further set of packages as “subrepositories,” which often do not have the same support as the Standard Library. These are occasionally used. They will need to be installed using the go get command. These have package names including an “x,” such as golang.org/x/net/ipv4.
 
 
## GO 代理

[一个全球代理为 Go 模块而生](https://goproxy.io/zh/)
```
# 配置 GOPROXY 环境变量
export GOPROXY=https://proxy.golang.com.cn,direct
# 还可以设置不走 proxy 的私有仓库或组，多个用逗号相隔（可选）
export GOPRIVATE=git.mycompany.com,github.com/my/private
```

**通过go env 设置环境变量：**

`go env -w GOPROXY=https://goproxy.io,direct`

可以将环境变量写入go 的配置文件中，长久生效

**取消代理：**

`go env -u GOPROXY`  

## GO something

### [将VIM打造成go语言的ide](https://learnku.com/articles/24924)

`go version`  `go env`

### godoc and go doc

[The utility (or lack thereof) of godoc](https://forum.golangbridge.org/t/the-utility-or-lack-thereof-of-godoc/27906)

The godoc webserver is no longer included in the main binary distribution. To run the godoc webserver locally, manually install it first:
 
`go install golang.org/x/tools/cmd/godoc@latest`

