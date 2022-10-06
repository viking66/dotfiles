# Don't do anything if this is not an interactive shell
[[ $- != *i* ]] && return

# history
HISTCONTROL=ignoreboth
HISTSIZE=
HISTFILESIZE=
shopt -s histappend
export HISTTIMEFORMAT="[%F %T] "
export HISTFILE=~/.bash_eternal_history
PROMPT_COMMAND="history -a; $PROMPT_COMMAND"

# misc
shopt -s checkwinsize

# exports
export LESS="-R"
export EDITOR="nvim"

# aliases
alias ls='ls --color=auto'
alias ll='ls -alF'
alias la='ls -A'
alias grep='grep --color=auto'
alias v='nvim'

# helper functions
includeF () { [ -f "$1" ] && . "$1"; }

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# nord theme directory colors
[ -f "$HOME/.dir_colors" ] && eval $(dircolors $HOME/.dir_colors)

# completions
includeF "/usr/share/bash-completion/bash_completion"

# environments
if [ -e $HOME/.nix-profile/etc/profile.d/nix.sh ]; then
    . $HOME/.nix-profile/etc/profile.d/nix.sh
    export LOCALE_ARCHIVE="$(nix-env --installed --no-name --out-path --query glibc-locales)/lib/locale/locale-archive"
fi
includeF "$HOME/.cargo/env" # rust
includeF "$HOME/.ghcup/env" # ghcup

# fancy prompt with starship
[ -x "$(command -v starship)" ] && eval "$(starship init bash)"
