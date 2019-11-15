## install pstree

Linux pstree shows running processes as a tree. The tree is rooted at either pid or init if pid is omitted. If a user name is specified, all process trees rooted at processes owned by that user are shown.
Install pstree

```shell
# On Mac OS
brew install pstree
 
# On Fedora/Red Hat/CentOS
yum install psmisc #using psmisc package for pstree
 
# on Ubuntu/Debian APT

apt-get install psmisc

# After above opeation, we can use

 man pstree | less
```

to check whether the installation is successful.
