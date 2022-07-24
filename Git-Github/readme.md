## git & github usage

        working dircetory <<<--- git add (rm)/restore --->>> stage(index) <<<---git commit/restore --->>> local respository

![git](https://github.com/st286/st286/blob/b936d792565b3e6999185fe000b715db57e10d4a/Git-Github/git1.jpeg)

### 一、Git简介

Git是目前世界上最先进的分布式版本控制系统（没有之一）。Linus花了两周时间自己用C写了一个分布式版本控制系统，这就是Git！一个月之内，Linux系统的源码已经由Git管理了！

#### （1）在Linux上安装Git
       
       sudo apt-get install git

安装完成后，还需要最后一步设置，在命令行输入：

       git config --global user.name "Your Name"
       git config --global user.email "email@example.com"
       # 或用下面命令，直接编辑相应文本文件
       git config --global --edit

#### （2）创建版本库repository

什么是版本库呢？版本库又名仓库，英文名repository，你可以简单理解成一个目录，这个目录里面的所有文件都可以被Git管理起来，每个文件的修改、删除，Git都能跟踪，以便任何时刻都可以追踪历史，或者在将来某个时刻可以“还原”。所以，创建一个版本库非常简单，首先，选择一个合适的地方，创建一个空目录：

       mkdir yourdir
       cd yourdir
第二步，通过git init命令把这个目录变成Git可以管理的仓库：

       git init
当前目录下多了一个.git的目录

**把文件添加到版本库**

       git add yourfile1
       git add yourfile2
       git commit -m "your-message"  ## 确认生成新版本
 
### 二、时光机穿梭

要随时掌握工作区的状态，使用git status命令。

如果git status告诉你有文件被修改过，用git diff可以查看修改内容。

#### (1)版本回退

版本控制系统用git log命令查看历史记录

       git log 
       git log --pretty=oneline

if modified some files in working directory, then 'git status' shows:

       Changes not staged for commit:

       (use "git add <file>..." to update what will be committed)
       (use "git restore <file>..." to discard changes in working directory)
用下面命令恢复：

        git reset --hard commit_id
        git restore <file>

#### (2)工作区和暂存区

Working Directory

版本库（Repository）

Git的版本库里存了很多东西，其中最重要的就是称为stage（或者叫index）的暂存区，还有Git为我们自动创建的第一个分支master，以及指向master的一个指针叫HEAD。

#### (3)管理修改

        git add
        git commit
        git diff
        git restore

#### (4)撤销修改

git checkout -- file可以丢弃工作区的修改.git checkout -- file命令中的--很重要，没有--，就变成了“切换到另一个分支”的命令，我们在后面的分支管理中会再次遇到git checkout命令。

git restore

用命令git reset HEAD <file>可以把暂存区的修改撤销掉（unstage），重新放回工作区
        
#### (5)删除文件

一般情况下，你通常直接在文件管理器中把没用的文件删了，或者用rm命令删了.这个时候，Git知道你删除了文件，因此，工作区和版本库就不一致了，git status命令会立刻告诉你哪些文件被删除了.现在你有两个选择，一是确实要从版本库中删除该文件，那就用命令git rm删掉，并且git commit.

        git rm file
        git commit
        git restore
        git checkout -- file
        
### 三、远程仓库 github
   
        (1)注册GitHub账号
        (2)创建SSH Key: ssh-genkey
        (3)配置ssh config
                ## .ssh/config
                Host github.com
                HostName ssh.github.com
                User git
                Port 22
                IdentityFile ~/.ssh/st-github
        (4)copy ssh-key.pub to github (your ID)
 #### Quick setup — if you’ve done this kind of thing before
 
        git@github.com:st4swift/test.git
 #### …or create a new repository on the command line
        
        echo "# test" >> README.md
        git init
        git add README.md
        git commit -m "first commit"
        git branch -M main
        git remote add origin git@github.com:st4swift/test.git
        git push -u origin main
        
#### …or push an existing repository from the command line
        
        git remote add origin git@github.com:st4swift/test.git
        git branch -M main
        git push -u origin main
        
#### …or import code from another repository       
        
You can initialize this repository with code from a Subversion, Mercurial, or TFS project.
        
        
---
---
##  Git and Github Guide

  [万字详解！Git 入门最佳实践](https://segmentfault.com/a/1190000038867025)

  [git教程--廖雪峰](https://www.liaoxuefeng.com/wiki/896043488029600)

  [git--简明指南](https://rogerdudler.github.io/git-guide/index.zh.html)

  [图解Git](http://marklodato.github.io/visual-git-guide/index-zh-cn.html)

  [Git book](https://git-scm.com/book/zh/v2)

  [IBM Git 和 GitHub入门](https://www.ibm.com/developerworks/cn/opensource/os-cn-git-and-github-1/index.html?ca=drs-)

