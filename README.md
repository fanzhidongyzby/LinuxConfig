#LinuxConfig

Linux Go 语言开发环境Vim配置

##准备
* 安装Vim，版本7.2以上：`$ sudo yum install vim`
* 安装Git：`$ sudo yum install git`
* 切换到用户目录：`$ cd ~`
* 下载配置文件工程：`$ git clone https://github.com/fanzhidongyzby/LinuxConfig`

##配置Bash
* 替换系统Bash配置：<br>
`$ cp LinuxConfig/.bashrc ~`<br>
`$ source ~/.bashrc`

##配置Git
* 设置Git配置文件：`$ cp LinuxConfig/.gitconfig ~`
* 修改email和name字段

##安装Go
* 下载Go安装包：https://golang.org/dl/
* 解压安装：<br>
`$ cd ~/program; `<br>
`$ tar -xf go1.4.linux-amd64.tar.gz; rm go1.4.linux-amd64.tar.gz`
* 配置Go环境变量，在~/.bashrc最后添加（已经添加）：
```
#go export
export GOROOT=$HOME/program/go
export GOPATH=$HOME/go
export PATH=$GOROOT/bin:$PATH
```
* 测试Go命令: `$ go version`<br>
go version go1.4 linux/amd64

##安装Go开发环境插件
* 取出插件源码文件：`$ cp LinuxConfig/go ~ -r`
* 安装goimport：`$ go install github.com/bradfitz/goimports`
* 安装godef：`$ go install code.google.com/p/rog-go/exp/cmd/godef`
* 安装gocode：`$ go install github.com/nsf/gocode`
* 安装gotags：`$ go install github.com/jstemmer/gotags`

##配置Vim
* 设置Vim配置文件：`$ cp LinuxConfig/.vimrc ~`
* 安装Vim Go开发环境插件：`$ cp LinuxConfig/.vim ~ -r`

##使用测试
* Ctrl+n显示文件浏览器
* Ctrl+l显示Tagbar
* :w保存时自动格式化go代码，并且自动导入/删除import语句
* 光标放置在函数名上，按gd转移到函数定义

##参考资料
* https://www.google.com.hk/url?sa=t&rct=j&q=&esrc=s&source=web&cd=2&ved=0CCkQFjAB&url=%68%74%74%70%3a%2f%2f%77%75%77%65%6e%2e%6f%72%67%2f%61%72%74%69%63%6c%65%2f%33%38%2f%73%65%74%75%70%2d%76%69%6d%2d%67%6f%2d%64%65%76%2d%65%6e%76%69%72%6f%6e%6d%65%6e%74%2e%68%74%6d%6c&ei=okR9VLBPguyYBcingrgI&usg=AFQjCNGqKslwKGkGwOt-mGTrgu4v3y-BoQ
* http://ju.outofmemory.cn/entry/49172

