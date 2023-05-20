
## emacs for go lang ; init-go.el

#### golang env 

      export PATH=$PATH:/usr/local/go/bin
      
      export GOPATH=$HOME/go
      export PATH=$PATH:$GOPATH/bin
      
#### 依赖

golps:

     go install golang.org/x/tools/gopls@latest
     
     https://pkg.go.dev/golang.org/x/tools/gopls
    
goimports:

    go install golang.org/x/tools/cmd/goimports@latest

    https://pkg.go.dev/golang.org/x/tools/cmd/goimports

