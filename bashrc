#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

set -o vi
shopt -s checkwinsize

export GREP_COLOR="1;33"
export LESS="-R"

alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias wicd='wicd-curses'
alias vi='vim'
alias battery='acpi'
alias vid='mplayer -fs -softvol -softvol-max 400'
alias tmux='tmux -2'
export EDITOR=vim

prompt_command () {
    local rts=$?
    local w=$(echo "${PWD/#$HOME/~}" | sed 's/.*\/\(.*\/.*\/.*\)$/\1/') # pwd max depth 3
# pwd max length L, prefix shortened pwd with m
    local L=30 m='...'
    [ ${#w} -gt $L ] && { local n=$((${#w} - $L + ${#m}))
    local w="\[\033[0;32m\]${m}\[\033[0;37m\]${w:$n}\[\033[0m\]" ; } \
    ||   local w="\[\033[0;37m\]${w}\[\033[0m\]"
# different colors for different return status
    [ $rts -eq 0 ] && \
    local p="\[\033[1;30m\]>\[\033[0;32m\]>\[\033[1;32m\]>\[\033[m\]" || \
    local p="\[\033[1;30m\]>\[\033[0;31m\]>\[\033[1;31m\]>\[\033[m\]"
    local rt="\[\033[0:32m\][\u@\h]"
    # PS1="${rt} ${w} ${p} "
    PS1="${w} ${p} "
}
PROMPT_COMMAND=prompt_command

# up and down arrow history search
bind '"\e[A":history-search-backward'
bind '"\e[B":history-search-forward'

export PATH="$PATH:~/bin:/home/jason/.gem/ruby/1.9.1/bin"
source ~/.git-completion.bash
