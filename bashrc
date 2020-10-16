export BASH_SILENCE_DEPRECATION_WARNING=1

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
# TODO shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# enable programmable completion features
safe_source() { [ -f $1 ] && . $1; }
safe_source /etc/bash_completion.d/git-prompt
safe_source /usr/local/etc/bash_completion
safe_source /Library/Developer/CommandLineTools/usr/share/git-core/git-completion.bash
safe_source /Library/Developer/CommandLineTools/usr/share/git-core/git-prompt.sh

# local binaries
export PATH="$PATH:~/.local/bin"

# setup prompt
export PS1='\n\[\e[1m\]\w$(__git_ps1)\n$ \[\e[0m\]'

# fixes ctrl-s issue in terminal applications
stty -ixon

# # #
alias tmp='pushd $(mktemp -d)'
alias ll='ls -AFGgohl'
alias cds='cd ~/workspace/source'

# Avoid nested NeoVim instances (i.e. editing git messages)
if [ -n "$NVIM_LISTEN_ADDRESS" ]; then
  export VISUAL="nvr -cc split --remote-wait +'set bufhidden=wipe'"
else
  export VISUAL="nvim"
fi
export EDITOR="$VISUAL"
