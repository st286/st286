## git & github usage

### Git简介

Git是目前世界上最先进的分布式版本控制系统（没有之一）。Linus花了两周时间自己用C写了一个分布式版本控制系统，这就是Git！一个月之内，Linux系统的源码已经由Git管理了！

#### 在Linux上安装Git
       
       sudo apt-get install git

安装完成后，还需要最后一步设置，在命令行输入：

       git config --global user.name "Your Name"
       git config --global user.email "email@example.com"
       # 或用下面命令，直接编辑相应文本文件
       git config --global --edit

#### 创建版本库repository

什么是版本库呢？版本库又名仓库，英文名repository，你可以简单理解成一个目录，这个目录里面的所有文件都可以被Git管理起来，每个文件的修改、删除，Git都能跟踪，以便任何时刻都可以追踪历史，或者在将来某个时刻可以“还原”。所以，创建一个版本库非常简单，首先，选择一个合适的地方，创建一个空目录：

       mkdir yourdir
       cd yourdir
第二步，通过git init命令把这个目录变成Git可以管理的仓库：

       git init
当前目录下多了一个.git的目录



---
##  Git and Github Guide

  [万字详解！Git 入门最佳实践](https://segmentfault.com/a/1190000038867025)

  [git教程--廖雪峰](https://www.liaoxuefeng.com/wiki/896043488029600)

  [git--简明指南](https://rogerdudler.github.io/git-guide/index.zh.html)

  [图解Git](http://marklodato.github.io/visual-git-guide/index-zh-cn.html)

  [Git book](https://git-scm.com/book/zh/v2)

  [IBM Git 和 GitHub入门](https://www.ibm.com/developerworks/cn/opensource/os-cn-git-and-github-1/index.html?ca=drs-)


