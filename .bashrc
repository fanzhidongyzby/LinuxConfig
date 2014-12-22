# ~/.bashrc: executed by bash(1) for non-login shells.
# If not running interactively, don't do anything
[[ $- != *i* ]] && return
export TERM=xterm-256color

# prompt
PS1="\n\[\033[0;37m\]\342\224\214\342\224\200\$(if [[ \$? != 0 ]]; then echo '\[\033[0;31m\] N\[\033[0;37m\]\040\342\224\200'; else echo '\[\033[0;32m\] Y\[\033[0;37m\]\040\342\224\200'; fi)[\$(if [[ ${EUID} == 0 ]]; then echo '\[\033[0;31m\]\h'; else echo '\[\033[0;33m\]\u\[\033[0;37m\]@\[\033[0;96m\]\h'; fi)\[\033[0;37m\]]\342\224\200[\[\033[0;32m\]\w\[\033[0;37m\]]\n\[\033[0;37m\]\342\224\224\342\224\200\342\224\200\342\224\200 \[\033[0m\]"

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

# translate English to Chinese using jianbing DNS TXT
function t()
{
  dig "$*.jianbing.org" +short txt | perl -pe's/\\(\d{1,3})/chr $1/eg; s/(^"|"$)//g'
}

########################
# aliases
########################

alias sudo='sudo env PATH=$PATH'
alias v='vim'
alias vi='vim'
alias cls='clear'
alias ls='ls --color'
alias ll='ls -AlF'
alias la='ls -A'
alias l='ls -CF'

alias grep='grep --color=auto -n'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'
alias cls='clear'
alias mk='make'

########################
# exports
########################

#go export
export GOROOT=$HOME/program/go
export GOPATH=$HOME/go
export PATH=$GOROOT/bin:$PATH

