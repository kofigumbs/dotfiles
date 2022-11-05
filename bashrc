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
safe_source $HOME/.cargo/env
safe_source $HOME/asdf.sh
safe_source $HOME/asdf/completions/asdf.bash
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

# Editor
export VISUAL="nvim"
export EDITOR="nvim"

# Aliases
alias tmp='pushd $(mktemp -d)'
alias ll='ls -AFGgohl'

screenshot() {
  URL="$1"

  if [[ -z "$URL" ]]
  then
      echo "Take a screenshot with Google Chrome. Default size is 1024x1024."
      echo ""
      echo "USAGE:"
      echo "  screenshot PATH|URL [SIZE]"
      echo ""
      return 1
  fi

  if [[ "$URL" != http* ]]
  then
      URL="file://`realpath $URL`"
  fi

  "/Applications/Google Chrome.app/Contents/MacOS/Google Chrome" \
      --headless \
      --default-background-color=00000000 \
      --window-size="${2:-1024x1024}" \
      --screenshot="$HOME/Desktop/`date +"%Y-%m-%dT%H:%M:%S"`.png" \
      "$URL"
}
