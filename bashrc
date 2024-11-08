#!/bin/bash

[[ $- != *i* ]] && return

# colors() {
#   local fgc bgc vals seq0
#
#   printf "Color escapes are %s\n" "\e[${value};...;${value}m"
#   printf "Values 30..37 are \e[33mforeground colors\e[m\n"
#   printf "Values 40..47 are \e[43mbackground colors\e[m\n"
#   printf "Value  1 gives a  \e[1mbold-faced look\e[m\n\n"
#
#   # foreground colors
#   for fgc in {30..37}; do
#     # background colors
#     for bgc in {40..47}; do
#       fgc=${fgc#37} # white
#       bgc=${bgc#40} # black
#
#       vals="${fgc:+$fgc;}${bgc}"
#       vals=${vals%%;}
#
#       seq0="${vals:+\e[${vals}m}"
#       printf "  %-9s" "${seq0:-(default)}"
#       printf " ${seq0}TEXT\e[m"
#       printf " \e[${vals:+${vals+$vals;}}1mBOLD\e[m"
#     done
#     echo; echo
#   done
# }

[ -r /usr/share/bash-completion/bash_completion ] && . /usr/share/bash-completion/bash_completion

# Change the window title of X terminals
case ${TERM} in
  xterm*|rxvt*|Eterm*|aterm|kterm|gnome*|interix|konsole*)
    PROMPT_COMMAND='echo -ne "\033]0;${USER}@${HOSTNAME%%.*}:${PWD/#$HOME/\~}\007"'
    ;;
  screen*)
    PROMPT_COMMAND='echo -ne "\033_${USER}@${HOSTNAME%%.*}:${PWD/#$HOME/\~}\033\\"'
    ;;
esac

use_color=true

# Set colorful PS1 only on colorful terminals.
# dircolors --print-database uses its own built-in database
# instead of using /etc/DIR_COLORS.  Try to use the external file
# first to take advantage of user additions.  Use internal bash
# globbing instead of external grep binary.
safe_term=${TERM//[^[:alnum:]]/?}   # sanitize TERM
match_lhs=""
[[ -f ~/.dir_colors   ]] && match_lhs="${match_lhs}$(<~/.dir_colors)"
[[ -f /etc/DIR_COLORS ]] && match_lhs="${match_lhs}$(</etc/DIR_COLORS)"
[[ -z ${match_lhs}    ]] \
  && type -P dircolors >/dev/null \
  && match_lhs=$(dircolors --print-database)
[[ $'\n'${match_lhs} == *$'\n'"TERM "${safe_term}* ]] && use_color=true

if ${use_color} ; then
  # Enable colors for ls, etc.  Prefer ~/.dir_colors #64489
  if type -P dircolors >/dev/null ; then
    if [[ -f ~/.dir_colors ]] ; then
      eval "$(dircolors -b ~/.dir_colors)"
    elif [[ -f /etc/DIR_COLORS ]] ; then
      eval "$(dircolors -b /etc/DIR_COLORS)"
    fi
  fi

  # Initial 'idea' from here: https://thucnc.medium.com/how-to-show-current-git-branch-with-colors-in-bash-prompt-380d05a24745
  parse_git_branch() {
    branch=$(git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/')
    # if [[ ! -z $branch ]]; then
    if [[ -n $branch ]]; then
      echo " ( $branch)"
    fi
  }

  export red="\033[1;31m"
  export green="\033[1;32m"
  export yellow="\033[1;33m"
  export blue="\033[1;34m"
  export magenta="\033[1;35m"
  export cyan="\033[1;36m"
  export grey="\033[0;37m"
  export reset="\033[m"
  if [[ ${EUID} == 0 ]] ; then
    PS1='\[\033[01;31m\][\h\[\033[01;36m\] \W\[\033[01;31m\]$(parse_git_branch)]\$\[\033[00m\] '
  else
    #PS1='\[\033[01;32m\][\u@\h\[\033[01;37m\] \W\[\033[01;32m\]]\$\[\033[00m\] '
    # PS1='\[\033[01;32m\][\u@\h\[\033[01;37m\] \W\[\033[01;32m\]$(parse_git_branch)]\$\[\033[00m\] '
    # PS1='\[\033[01;35m\][\u@\h\[\033[01;37m\] \W\[\033[01;35m\]$(parse_git_branch)]\$\[\033[00m\] '
    PS1="${magenta}[\u@\h${grey} \W${magenta}$(parse_git_branch)]\$${reset} "
  fi

  export LS_OPTIONS='--color=auto --group-directories-first'
  alias ls='ls --color=auto'
  alias ll='ls $LS_OPTIONS -l'
  alias lll='clear && ls $LS_OPTIONS -l'
  alias la='ls $LS_OPTIONS -lA'
  alias grep='grep --colour=auto'
  alias egrep='egrep --colour=auto'
  alias fgrep='fgrep --colour=auto'
else
  if [[ ${EUID} == 0 ]] ; then
    PS1='\u@\h \W \$ '
  else
    PS1='\u@\h \w \$ '
  fi
fi

unset use_color safe_term match_lhs sh

HISTSIZE=5000

# custom aliases
alias ..='cd ..'
alias ..l='cd .. && ll'
alias cp="cp -i"                          # confirm before overwriting something
alias df='df -h'                          # human-readable sizes
alias free='free -m'                      # show sizes in MB
alias hist='history'
alias temp='sensors | grep high | grep -v Composite'
alias dd='dd status=progress'
alias lsblk='lsblk -o name,size,type,mountpoint,model'
alias ge='cd /etc'
alias ping3='ping -c 3'
alias nv='nvim'
alias tree='tree -I roles'
alias bat='bat --theme Coldark-Dark -p'

# terraform
alias tf='terraform'
alias tfi='terraform init'
alias tfp='terraform plan'
alias tfa='terraform apply'
alias tfaa='terraform apply -auto-approve'
alias tfda='terraform apply -destroy -auto-approve'

# SSH
alias gw='ssh gateway.a.binary-io.net'

# Packagemanager
alias upgrade='paru -Syyuu'
alias inst='paru -Syu'
alias searcho='paru -Ss'
alias searchl='paru -Qs'
alias remove='paru -R'
alias removed='paru -Rs'
alias orph='paru -Qtdq'
alias fixpacmanlock='sudo rm /var/lib/pacman/db.lck'

# Git
alias g='git'
alias gf='git fetch'
alias gp='git pull'
alias gps='git push'
alias gb='git branch'
alias gc='git clone'
alias gco='git checkout'
alias gd='git diff'
alias gl='git log'
alias gll='git lg'
alias glo='git log --oneline'
alias gs='git status'
alias gcm='git checkout main'
alias gcd='git checkout develop'
alias gct='git checkout --track'
alias glom='git log origin/master'
alias gpo='git remote prune origin'
alias grh='git revert HEAD'

gpl() {
  [ -z "$1" ] && git branch -r | awk '{print $1}' | grep -E -v -f /dev/fd/0 <(git branch -vv | grep origin) | awk '{print $1}' | xargs git branch -d || \
  [ "$1" == "-f" ] && git branch -r | awk '{print $1}' | grep -E -v -f /dev/fd/0 <(git branch -vv | grep origin) | awk '{print $1}' | xargs git branch -D
}

xhost +local:root > /dev/null 2>&1

complete -cf sudo

# Bash won't get SIGWINCH if another process is in the foreground.
# Enable checkwinsize so that bash will check the terminal size when
# it regains control.  #65623
# http://cnswww.cns.cwru.edu/~chet/bash/FAQ (E11)
shopt -s checkwinsize

shopt -s expand_aliases

# export QT_SELECT=4

# Enable history appending instead of overwriting.  #139609
shopt -s histappend

# ex - archive extractor
# usage: ex <file>
ex ()
{
  if [ -f "$1" ] ; then
    case $1 in
      *.tar.bz2)   tar xjf "$1"   ;;
      *.tar.gz)    tar xzf "$1"   ;;
      *.bz2)       bunzip2 "$1"   ;;
      *.rar)       unrar x "$1"   ;;
      *.gz)        gunzip "$1"    ;;
      *.tar)       tar xf "$1"    ;;
      *.tbz2)      tar xjf "$1"   ;;
      *.tgz)       tar xzf "$1"   ;;
      *.zip)       unzip "$1"     ;;
      *.Z)         uncompress "$1";;
      *.7z)        7z x "$1"      ;;
      *)           echo "'$1' cannot be extracted via ex()" ;;
    esac
  else
    echo "'$1' is not a valid file"
  fi
}

mytop10() {
  history | awk '{CMD[$2]++;count++;}END { for (a in CMD)print CMD[a] " " CMD[a]/count*100 "% " a;}' | grep -v "./" | column -c3 -s " " -t | sort -nr |  head -n10
}

lsg() {
  keyword=$(echo "$@" |  sed 's/ /.*/g')
  ls -hlA --color=yes \
  | awk '{k=0;for(i=0;i<=8;i++)k+=((substr($1,i+2,1)~/[rwx]/)*2^(8-i));if(k)printf(" %0o ",k);print}' \
  | grep -iE "$keyword"
}

cl() {
  local dir="$1"
  local dir="${dir:=$HOME}"
  if [[ -d "$dir" ]]; then
    cd "$dir" > /dev/null; ll
  else
    echo "bash: cl: $dir: Directory not found"
  fi
}

histg() {
  local grepFor="$1"
  [ -n "$grepFor" ] && history | grep "$grepFor" || echo "Add search paramter!"
}

requiredby() {
  local searchFor="$1"
  [ -n "$searchFor" ] && pacman -Qi "$searchFor" | grep "Required By"
}

# additional rc for work
[[ -f ~/.shell_extensions_work ]] && source ~/.shell_extensions_work

eval "$(zoxide init bash --cmd cd)"
