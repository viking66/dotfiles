#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

set -o vi
shopt -s checkwinsize
complete -cf sudo

export GREP_COLOR="1;33"
export LESS="-R"

alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias wicd='wicd-curses'
alias vi='vim'
alias vid='mplayer -fs -softvol -softvol-max 400'
alias tmux='tmux -2'
alias luajit='rlwrap luajit'
alias projector="xrandr --output LVDS1 --mode 1366x768 --output HDMI1 --mode 1920x1080 --right-of LVDS1"
alias noscreensaver="xset -dpms; xset s off"
export EDITOR=vim
export TERMINAL="/usr/local/bin/st"

export PATH="$PATH:/home/jason/bin:/home/jason/.gem/ruby/2.0.0/bin"
source ~/.git-completion.bash

export HISTFILESIZE=
export HISTSIZE=
export HISTFILE=~/.bash_eternal_history
export HISTCONTROL=ignoreboth:erasedups
shopt -s histappend

VBOX_USB=usbfs

prompt_command () {
    history -a; history -c; history -r
    local rts=$?
    local w=$(echo "${PWD/#$HOME/~}" | sed 's/.*\/\(.*\/.*\/.*\)$/\1/') # pwd max depth 3
# pwd max length L, prefix shortened pwd with m
    local L=30 m='...'
    [ ${#w} -gt $L ] && { local n=$((${#w} - $L + ${#m}))
    local w="\[\033[0;32m\]${m}\[\033[0;37m\]${w:$n}\[\033[0m\]" ; } \
    ||   local w="\[\033[0;37m\]${w}\[\033[0m\]"
# different colors for different return status
    [ $rts -eq 0 ] && \
    local p="\[\033[0;36m\]>\[\033[1;36m\]>\[\033[m\]" || \
    local p="\[\033[0;31m\]>\[\033[1;31m\]>\[\033[m\]"
    local rt="\[\033[0:32m\][\u@\h]"
    # PS1="${rt} ${w} ${p} "
    PS1="${w} ${p} "
}
PROMPT_COMMAND=prompt_command
