
### [The LLVM Compiler Infrastructure](https://llvm.org)

[Clang Format在Mac上的安装与使用](https://juejin.cn/post/6844903886390558733)

### [Ninja is a small build system with a focus on speed](https://github.com/ninja-build/ninja)


---

## C language

  0. [The C Book](https://publications.gbdirect.co.uk/c_book/)

  1. [笨办法学C 中文版](https://wizardforcel.gitbooks.io/lcthw/content/)
  
  2. [C语言学习资源整理](https://zhuanlan.zhihu.com/p/23677249)
  
  3. [GNU make](https://www.gnu.org/software/make/manual/html_node/index.html#Top0)     
     [Make 命令教程](http://www.ruanyifeng.com/blog/2015/02/make.html)    
     [Makefile使用(简书)](https://www.jianshu.com/p/8dc048ae1e11)   
     [ Valgrind](http://valgrind.org/)

---
## [Advanced Programming in the UNIX® Environment](http://www.apuebook.com/)

编译器的(头)文件搜索（include）路径:
```      
echo | clang -v -x c -E -
echo | gcc -v -x c++ -E -
```
将 apue.h, error.c copy to /usr/local/include/

[Source Code of APUE third edition](http://www.apuebook.com/code3e.html)

[Unix环境高级编程-“apue.h“的导入与使用](https://blog.csdn.net/oneMelon/article/details/109521286?spm=1001.2101.3001.6650.17&utm_medium=distribute.pc_relevant.none-task-blog-2%7Edefault%7EBlogCommendFromBaidu%7Edefault-17-109521286-blog-48106579.pc_relevant_default&depth_1-utm_source=distribute.pc_relevant.none-task-blog-2%7Edefault%7EBlogCommendFromBaidu%7Edefault-17-109521286-blog-48106579.pc_relevant_default)

[apue.h头文件](https://blog.csdn.net/Function_Dou/article/details/79227071?spm=1001.2101.3001.6650.2&utm_medium=distribute.pc_relevant.none-task-blog-2%7Edefault%7ECTRLIST%7Edefault-2-79227071-blog-48106579.pc_relevant_default&depth_1-utm_source=distribute.pc_relevant.none-task-blog-2%7Edefault%7ECTRLIST%7Edefault-2-79227071-blog-48106579.pc_relevant_default)

---
## 0x02 [c语言 指针数组详解](http://www.codebaoku.com/it-c/it-c-233073.html)

### [C语言 指针数组和数组指针区别](https://www.codersrc.com/archives/8613.html)

---
## 0x01 [The Unofficial C For Dummies Website](https://c-for-dummies.com/)


## 0x00 The [C Standary Library](https://www.tutorialspoint.com/c_standard_library/)

### getline( )

#### [Having Fun with the getline() Function](https://c-for-dummies.com/blog/?p=5445)

####  [The getline() Function – Update](https://c-for-dummies.com/blog/?p=5432)

####  [Getline function in C](https://linuxhint.com/getline-function-c/)

###  [malloc( )](https://www.tutorialspoint.com/c_standard_library/c_function_malloc.htm)
     
---
## 在linux上，使用clang (clang++) or gcc (g++) compiler

  以Pop!_OS(based on ubuntu)为例：
    
###  安装Clang:
```
sudo apt update && sudo apt upgrade -y
sudo apt install clang
```
  **Clang's  c & c++ compiler 以 clang and clang++ 形式使用。要使make用Clang编译，要设置环境变量，指定编译器,如下：**
```
export CC=clang
export CXX=clang++
```
### 使用较新的 gcc-12, g++-12
```
sudo apt install gcc-12 g++-12

cd /usr/bin

rm gcc g++

sudo ln -s  gcc-12   gcc
sudo ln -s  g++-12   g++

## ln -s  source  dist
```
  cc link to /usr/bin/gcc
  
  c++ link to /usr/bin/g++
#### 参考： [llvm, clang 和 scan-build 的安装和使用](https://www.codeleading.com/article/51451938487/)
