

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
    
####  安装clang:
```
sudo apt update && sudo apt upgrade -y
sudo apt install clang
```
  clang's  c and c++ compiler 以 clang and clang++ 形式使用。要用make 编译，要设置环境变量，指定编译器：
```
export CC=clang
export CXX=clang++
```
#### 使用较新的 gcc-12, g++-12
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
