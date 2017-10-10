# ~/.bashrc: executed by bash(1) for non-login shells.
# If not running interactively, don't do anything
[[ $- != *i* ]] && return
export TERM=xterm-256color

# prompt
#PS1="\n\[\033[0;37m\]\342\224\214\342\224\200\$(if [[ \$? != 0 ]]; then echo '\[\033[0;31m\] N\[\033[0;37m\]\040\342\224\200'; else echo '\[\033[0;32m\] Y\[\033[0;37m\]\040\342\224\200'; fi)[\$(if [[ ${EUID} == 0 ]]; then echo '\[\033[0;31m\]\h'; else echo '\[\033[0;33m\]\u\[\033[0;37m\]@\[\033[0;96m\]\h'; fi)\[\033[0;37m\]]\342\224\200[\[\033[0;32m\]\w\[\033[0;37m\]]\n\[\033[0;37m\]\342\224\224\342\224\200\342\224\200\342\224\200 \[\033[0m\]"
PS1="(\[\033[0;32m\]\u\[\033[0m\]) \[\033[0;31m\]\w\[\033[0m\] \$ "
#PS1="\[\033[0;31m\]\w\[\033[0m\] \$ "

# don't put duplicate lines or lines starting with space in the history.
HISTCONTROL=ignoreboth
HISTSIZE=1000
HISTFILESIZE=2000
HISTTIMEFORMAT="%F %T "

# append to the history file, don't overwrite it
shopt -s histappend

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.

# editor
#set -o vi
export EDITOR="vim"


#color set for ls
LS_COLORS='di=32:fi=33:ln=31:pi=5:so=5:bd=5:cd=5:or=31:mi=0:ex=91:*.a=35'
export LS_COLORS

# remember last directory
LAST_DIR=$HOME/.last_dir
function cd()
{
  builtin cd "$@"
    pwd > $LAST_DIR
}
[ -f $LAST_DIR ] && cd `cat $LAST_DIR`

########################
# aliases
########################

alias sudo='sudo env PATH=$PATH'
alias v='vim'
alias vi='vim'
alias cls='clear'
alias ls='ls -G'
alias ll='ls -AlF'
alias la='ls -A'
alias l='ls -CF'
alias g='git'
alias s='ls'

alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'
alias cls='clear'
alias mk='make'

alias his='history | grep'
alias ..='cd ..'
alias ...='cd ../..'
alias gst='g st'
alias gcm='g cm'
alias gbr='g br'
alias gck='g ck'
alias gdf='g df'
alias gad='g ad'
alias glo='g lo'
alias gpl='g pl'
alias gps='g ps'
alias gfc='g fc'
alias gre='g re'
alias gsh='g sh'
alias gmg='g mg'
alias grb='g rb'
alias grs='g rs'

dir() { mkdir -p "$1"; cd "$1";}
cl() { cd "$1"; ls;}
cll() { cd "$1"; ll;}
bak() { cp "$1"{,.bak};} 
ck() { md5sum "$1" | grep "$2";}

lso() {
  if [[ -n "$1" ]]; then
    sudo lsof -nP -sTCP:LISTEN -iTCP | grep $1
  else
    sudo lsof -nP -sTCP:LISTEN -iTCP
  fi
}

lsp() {
  if [[ -n "$1" ]]; then
    sudo ps aux | grep $1
  else
    sudo ps aux
  fi
}

dj() {
  JarFile=$1
  Pattern=$2
  if [[ -z $JarFile || -z $Pattern ]]; then
    echo "使用IntelijIdea自动反编译Jar包内的文件"
	echo "Usage:"
	echo "    dj <Jar文件> <文件名关键字> [<索引>]"
    return 1
  fi
  if [[ ! -e $JarFile ]]; then
    echo "文件"$JarFile"不存在"
    return 1
  fi

  Files=($(jar tf $JarFile 2>/dev/null | grep -E "$Pattern\\w*\\.?\\w*$" | grep -v "\\$"))
  File=""
  if [[ -z $Files ]]; then
    echo "没有找到匹配文件"
    return 1
  elif [[ ${#Files[@]} -eq 1 ]]; then
  	File=${Files[0]}
  else
  	echo "找到以下文件:"
  	for (( i=0; i<${#Files[@]}; i++ ));do
      echo "$i: ${Files[$i]}"
    done
  
    Index=$3
    if [[ -z $Index ]];then
      echo -n "选择文件: "
      read Index
    fi
    if [ $Index -lt 0 ] 2>/dev/null; then
      return 1
    fi
    if [ $Index -lt ${#Files[@]} ] 2>/dev/null; then
      File=${Files[$Index]}
    fi
  fi

  if [[ -z $File ]]; then
    return 1
  fi

  Tmp=/tmp/dj
  mkdir -p $Tmp && unzip -oj $JarFile $File -d $Tmp &>/dev/null
  idea $Tmp/$(basename $File) && echo "已打开文件$(basename $File)"
}

########################
# exports
########################
export GOPATH=$HOME/go
export GOBIN=$HOME/go/bin
export JAVA_HOME=/Library/Java/JavaVirtualMachines/1.6.0.jdk/Contents/Home/
export MVN_HOME=/usr/local/apache-maven-3.0.5
export PATH=.:$JAVA_HOME/bin:$MVN_HOME/bin:$PATH
