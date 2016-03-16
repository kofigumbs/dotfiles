HISTFILE=$HOME/.zsh_history
HISTSIZE=256
SAVEHIST=256

setopt append_history
setopt hist_ignore_dups
setopt hist_verify
setopt prompt_subst

bindkey '^[[Z' reverse-menu-complete

autoload -Uz vcs_info
zstyle ':vcs_info:*' enable git

precmd () { vcs_info }
export RPROMPT='${vcs_info_msg_0_}'
export PROMPT='%1~ $ '

# The following lines were added by compinstall

zstyle ':completion:*' completer _expand _complete _ignored _correct _approximate
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
zstyle ':completion:*' matcher-list 'm:{[:lower:]}={[:upper:]}'
zstyle ':completion:*' menu select=1
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle :compinstall filename '/Users/hkgumbs/.zshrc'

autoload -Uz compinit
compinit -u
# End of lines added by compinstall
