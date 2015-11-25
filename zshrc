HISTFILE=$HOME/.zsh_history
HISTSIZE=256
SAVEHIST=256

setopt append_history
setopt hist_ignore_dups
setopt hist_verify

bindkey '^[[A' up-line-or-search
bindkey '^[[B' down-line-or-search
bindkey '\E[Z' reverse-menu-complete

export PROMPT='%1~ ⌘  '
