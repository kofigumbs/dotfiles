export BASH_SILENCE_DEPRECATION_WARNING=1

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# Don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# Append to the history file, don't overwrite it
shopt -s histappend

# For setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# Check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# The pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
# TODO shopt -s globstar
shopt -s extglob

# Make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# Enable programmable completion features
safe_source() { [ -f $1 ] && . $1; }
safe_source $HOME/.secrets.env
safe_source /etc/bash_completion.d/git-prompt
safe_source /usr/local/etc/bash_completion
safe_source /Applications/Xcode.app/Contents/Developer/usr/share/git-core/git-completion.bash
safe_source /Applications/Xcode.app/Contents/Developer/usr/share/git-core/git-prompt.sh
safe_source /Library/Developer/CommandLineTools/usr/share/git-core/git-completion.bash
safe_source /Library/Developer/CommandLineTools/usr/share/git-core/git-prompt.sh

# Local binaries
export PATH="$PATH:~/.local/bin"

# Setup prompt
export PS1='\n\[\e[1m\]\w$(__git_ps1)\n$ \[\e[0m\]'

# Fixes ctrl-s issue in terminal applications
stty -ixon

# Aliases
alias tmp='pushd $(mktemp -d)'
alias ll='ls -AFGgohl'
alias cds='cd ~/workspace/source'

# Avoid nested NeoVim instances (i.e. git commit from a term split)
v() {
  if [ -z "$NVIM_LISTEN_ADDRESS" ]
  then # NeoVim is _not_ already open in this terminal
    nvim $@
  elif [ -z "$*" ]
  then # NeoVim is already open -- no arguments were passed
    nvr +new
  else # NeoVim is already open -- forward passed arguments
    nvr -cc split --remote-wait +'set bufhidden=wipe' $@
  fi
}
export VISUAL="v"
export EDITOR="v"

