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
shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"


# enable color support of ls
alias ls='gls --color'
alias ll='gls -AFGgohl'


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

# quickly make a new directory for experimenting
alias tmp='pushd $(mktemp -d)'
