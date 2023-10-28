autoload -U colors && colors    # Load colors

alias htop="btop"

alias vim="nvim"
alias vi="nvim"
alias nano="nvim"

alias ls="exa --long --header --icons --sort=type"
alias tree="exa --tree --level 3"
alias sdn="sudo shutdown -h now"
alias cp="cp -i"

bindkey -e
bindkey "^[[1;5C" forward-word
bindkey "^[[1;5D" backward-word 

HISTSIZE=10000000
SAVEHIST=10000000

HISTFILE=$XDG_CACHE_HOME/zsh/history

autoload -U compinit
zstyle ":completion:*" menu select
zmodload zsh/complist
compinit
_comp_options+=(globdots)

export GPG_TTY=$(tty)

eval "$(starship init zsh)"
